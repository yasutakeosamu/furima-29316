Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users, only: [:show]
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
   resources :orders, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
