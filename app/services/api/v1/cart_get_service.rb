
module Services::Api::V1
  class CartGetService
    include Interactor

    def call
      cart = Cart.still_open.includes(items: :beer).find_by(id: context.cart_id)

      if cart.present?
        context.cart = CartRepresenter.new(cart).to_hash
      else
        context.fail!(error: cannot_find_cart_error_data)
      end
    end

    private

    def cannot_find_cart_error_data
      {
        msg: "Cannot find an open cart with id #{context.cart_id}",
        code: 103
      }
    end

  end
end
