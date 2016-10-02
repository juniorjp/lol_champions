Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/home/set_user_locale' => 'home#set_user_locale'

  resources :champions

  resources :items
end
