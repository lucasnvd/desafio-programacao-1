module Api::V1
  class CartController < BaseController

    def show
      result = CartGetService.call(cart_id: params[:id])

      if result.success?
        render(json: { success: true, cart: result.cart })
      else
        render(json: { success: false, error: result.error })
      end
    end

    def add
      result = CartAddProductService.call(context_params)

      if result.success?
        render(json: { success: true, cart_id: result.cart_id })
      else
        render(json: { success: false, error: result.error })
      end
    end

    def remove
      result = CartRemoveProductService.call(remove_params)

      if result.success?
        render(json: { success: true, cart_was_canceled: result.cart_was_canceled || false })
      else
        render(json: { success: false, error: result.error })
      end
    end

    private

    def remove_params
      {
        requested_beer_id: params[:requested_beer_id],
        cart_id:           params[:cart_id],
        user:              current_user
      }
    end

    def context_params
      {
        requested_quantity: params[:requested_quantity],
        requested_beer_id:  params[:requested_beer_id],
        user:               current_user
      }
    end

  end
end
