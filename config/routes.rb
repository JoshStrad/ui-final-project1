Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # Done by Jeff Wedding
  root 'static_pages#home'
  get '/home',     to: 'static_pages#home'
  get '/register', to: 'users#new'
  get '/race_information', to: 'static_pages#race_information'
  get '/admin_page', to: 'static_pages#admin_page'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
end