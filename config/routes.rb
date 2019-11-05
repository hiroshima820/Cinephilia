Rails.application.routes.draw do
  devise_for :users
  get 'movies/search'
  get 'movies/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
