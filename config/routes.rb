Rails.application.routes.draw do
  namespace :v1 do
    resources :movies, only: [:index]
    post 'movies/import', to: 'movies#import'
  end
end
