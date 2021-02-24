Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :stores do
        resources :foods, only: %i[index]
      end
      resources :temporary_orders, only: %i[index create]
      put 'temporary_orders/replace', to: 'temporary_orders#replace'
      resources :orders, only: %i[create]
    end
  end
end
