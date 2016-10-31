Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :neighborhoods, only: [:index]
  root to: 'neighborhoods#index'
end
