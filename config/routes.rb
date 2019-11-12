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
  resources :users, only: [:index, :show, :edit]
  get 'movies/search'
  get 'movies/show/:id' => 'movies#show', as: 'movie_show'
  get 'genres/:id' => 'genres#show', as: 'genre'
  get 'people/:id' => 'people#show', as: 'person'

  get 'watcheds/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
