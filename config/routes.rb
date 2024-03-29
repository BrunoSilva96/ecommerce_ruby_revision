Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    namespace :v1 do
      get "home" => "home#index"
      resources :categories
      resources :users
      resources :products
      resources :system_requirements
      resources :coupons
      resources :games, only: [], shallow: true do
        resources :licenses
      end
    end
  end

  namespace :storefront do
    namespace :v1 do
      get "home" => "home#index"
      resources :products, only: [:index, :show]
      resources :categories, only: :index
      post "/coupons/:coupon_code/validations", to: "coupon_validations#create"
      resources :wish_items, only: [:index, :create, :destroy]
      resources :checkouts, only: :create
    end
  end
end
