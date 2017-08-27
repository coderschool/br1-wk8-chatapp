Rails.application.routes.draw do
  resources :messages

  resources :chatrooms do
    resources :messages
  end

  root 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
