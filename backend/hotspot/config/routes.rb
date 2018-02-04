Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :show]
    resource :session, only: [:create, :destroy]
    resources :connections, only: [:index, :create, :destroy]
    resources :listings, only: [:index, :create, :destroy]
    resources :lists, only: [:index, :create, :update, :destroy]
    resources :spots, only: [:index, :create, :update, :destroy]
    resources :recommendations, only: [:index, :create, :update, :destroy]
  end
end
