Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:show, :create]
    resource :session, only: [:create, :destroy]
    resources :connections, only: [:create, :update, :destroy]
    resources :listings, only: [:create, :destroy]
    resources :lists, only: [:create, :update, :destroy]
    resources :spots, only: [:index, :show, :create, :update, :destroy]
    resources :recommendations, only: [:create, :update, :destroy]
  end
end
