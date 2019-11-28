Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "homes#top"
  get 'homes/about'
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'movies/search'
  resources :movies, only: [:show] do
    resource :watcheds, only: [:new, :create, :edit, :update, :destroy]
    resource :checks, only: [:create, :update, :destroy]
  end

  get 'genres/:id' => 'genres#show', as: 'genre'
  get 'people/:id' => 'people#show', as: 'person'

  

  namespace :admins do
    root to: "homes#top"
    get 'homes/about'
    resources :users, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
