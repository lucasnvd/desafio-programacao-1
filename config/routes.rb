Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      scope path: '/cart', controller: :cart do

        post '/remove', action: :remove
        post '/add',    action: :add
        get '/:id',     action: :show

      end

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
