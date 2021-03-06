Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      root :to => 'users#index'
      post '/auth/login', to: 'authentication#login'
      resources :users, only: [:index, :create]
    end
  end
end
