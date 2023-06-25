Rails.application.routes.draw do
  resources :movies, only: [:index]
  post 'movies/import', to: 'movies#import'
end
