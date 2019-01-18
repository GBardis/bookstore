Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :authors, only: %i[create]
  resources :publishers, only: %i[create]
end
