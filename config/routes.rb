Rails.application.routes.draw do
  get '/', to: 'sessions#new'


  get 'users/new'

  resources :pictures
 get    '/signup',  to: 'users#new'
 get    '/login',   to: 'sessions#new'
 post   '/login',   to: 'pictures#new'
 delete '/logout',  to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
