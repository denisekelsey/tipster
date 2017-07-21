Rails.application.routes.draw do
  devise_for :users
  get 'places/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "places#index"
  resources :places
end

