Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    namespace :v1 do 
      resources :packages, only: [:index, :create, :update] do
        get "/price-updates", to: "packages#price_updates", on: :member
      end
    end
  end
end
