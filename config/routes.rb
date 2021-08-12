Rails.application.routes.draw do
  resources :subjects
  resources :posts
  devise_for :users

  root 'landing#index'
  get '/my_page' => 'my_page#index'
  get '/users/edit' => 'devise/registrations#edit'
  
  # devise_scope :user do
  #   get '/login' => 'devise/sessions#new'
  #   post '/login' => 'devise/session#create'
  #   delete '/sign_out' => 'devise/session#destroy'
  #   get '/sign_up' => 'devise/registrations#new'
  #   post 'users' => 'devise/registrations#create'
  #   get '/edit' => 'devise/registrations#edit'
  #   patch '/update' => 'devise/registrations#update'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
