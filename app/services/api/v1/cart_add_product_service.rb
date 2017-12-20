
module Services::Api::V1
  class CartAddProductService
    include Interactor

    def call
      check_requested_beer!
      check_availability!
      find_or_generate_new_cart!
      add_beer_to_cart!
      reduce_beer_stock!
    end

    private

    def check_requested_beer!
      @beer = Beer.find_by(id: context.requested_beer_id)
      context.fail!(error: cannot_find_beer_error_data) if @beer.nil?
    end

    def check_availability!
      context.fail!(error: too_much_requested_error_data) if context.requested_quantity > @beer.available
    end

    def find_or_generate_new_cart!
      @cart = context.user.carts.still_open.first_or_create
    end

    def add_beer_to_cart!
      item = @cart.items.still_present.where(beer_id: @beer.id).first_or_initialize
      item.requested_quantity += context.requested_quantity
      item.save

      context.cart_id = @cart.id
    end

    def reduce_beer_stock!
      @beer.available -= context.requested_quantity
      @beer.save
    end

    def cannot_find_beer_error_data
      {
        msg: "Cannot find beer with id #{context.requested_beer_id}.",
        code: 101
      }
    end

    def too_much_requested_error_data
      {
        msg: "The requested quantity for #{@beer.name} is not available.",
        code: 102
      }
    end

  end
end
