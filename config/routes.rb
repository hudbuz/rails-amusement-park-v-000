Rails.application.routes.draw do

root 'sessions#welcome'
resources :sessions
resources :attractions
resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy]
delete 'sessions', to: 'sessions#destroy'
get 'signin', to: 'sessions#new'
post 'signin', to: 'sessions#create'
post 'users/:id', to: 'users#ride'

end