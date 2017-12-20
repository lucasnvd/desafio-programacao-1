
module Services::Api::V1
  class CartRemoveProductService
    include Interactor

    def call
      find_open_cart!
      remove_beer_from_cart!
      increase_beer_stock!
      close_cart_if_possible!
    end

    private

    def find_open_cart!
      @cart = Cart.still_open.find_by(id: context.cart_id)
      context.fail!(error: cannot_find_cart_error_data) if @cart.nil?
    end

    def remove_beer_from_cart!
      @item = @cart.items.still_present.find_by(beer_id: context.requested_beer_id)

      if @item.present?
        context.fail!(error: item_was_already_removed_error_data) if @item.removed

        @item.removed = true
        @item.save
      else
        context.fail!(error: cannot_find_cart_item_error_data)
      end
    end

    def increase_beer_stock!
      beer = @item.beer

      beer.available += @item.requested_quantity
      beer.save
    end

    def close_cart_if_possible!
      if @cart.items.all? { |item| item.removed }
        @cart.canceled!
        context.cart_was_canceled = true
      end
    end

    def cannot_find_cart_error_data
      {
        msg: "Cannot find an open cart with id #{context.cart_id}",
        code: 103
      }
    end

    def cannot_find_cart_item_error_data
      {
        msg: "Cannot find item ##{context.requested_beer_id} on cart ##{context.cart_id}",
        code: 104
      }
    end

    def item_was_already_removed_error_data
      {
        msg: "The requested item ##{context.requested_beer_id} was already removed from cart ##{context.cart_id}",
        code: 105
      }
    end

  end
end
