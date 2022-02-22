Rails.application.routes.draw do
  get '/movies/:id', to: 'movies#show'

  get '/movie_actors', to: 'movie_actors#create'

  get '/studios', to: 'studios#index'
end
