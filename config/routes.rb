Rails.application.routes.draw do
  
  devise_for :users
  root "homes#top"

  post "/users/create",to:"users#create" 
  get "/users/account",to:"users#account"
  get "/users/account/edit",to:"users#account_edit"
  patch "/users/account/update",to:"users#account_update"
  get "/users/profile",to:"users#profile"
  get "/users/profile/edit",to:"users#profile_edit" 
  patch "/users/profile/update",to:"users#profile_update"
  delete "/users/:id/destroy",to:"users#destroy"
  

  get "/users/sign_in",to:"devise/sessions#new"
  post "/users/sign_in",to:"evise/sessions#create"
  delete "/users/sign_out",to:"devise/sessions#destroy"
  get "/users/password/new",to:"devise/passwords#new"
  get "/users/password/edit",to:"devise/passwords#edit"
  patch "/users/password",to:"devise/passwords#update"
  put "/users/password",to:"devise/passwords#update"
  post "/users/password",to:"devise/passwords#create"
  get "/users/cancel",to:"devise/registrations#cancel"
  get "/users/sign_up",to:"devise/registrations#new"
  get "/users/edit",to:"devise/registrations#edit"
  
  patch "/users",to:"devise/registrations#update"
  put "/users",to:"devise/registrations#update"
  delete "/users",to:"devise/registrations#destroy"
  post "/users",to:"devise/registrations#create"
  get "/users/sign_up",to: "devise/registrations#new"
  get 'users/account'
  
  
  get 'rooms/index',to:"rooms#index"
  get "/rooms/new",to:"rooms#new"
  post "/rooms/create",to:"rooms#create"
  get "/rooms/:id/edit",to:"rooms#edit"
  get "/rooms/:id/show",to:"rooms#show"
  patch "/rooms/:id/update",to:"rooms#update"
  delete "/rooms/:id/destroy",to:"rooms#destroy"
  get "/rooms/search",to:"rooms#search"

  get 'reservations/index'
  get "reservations/new",to:"reservations#new"
  get "reservations/confirm",to:"reservations#confirm"
  post "reservations/create",to:"reservations#create"
  get "reservations/:id/rebook",to:"reservations#rebook"
  get "reservations/:id/rebook_confirm",to:"reservations#rebook_confirm"
  patch "/reservations/:id/update",to:"reservations#update"
  delete "/reservations/:id/destroy",to:"reservations#destroy"


  resources :users
  resources :rooms
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
