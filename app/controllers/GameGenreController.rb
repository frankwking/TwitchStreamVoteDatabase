require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game_genres/:id/?' do
    @gameGenre = GameGenre.find params[:id]
    haml :game_genre_show
  end

  delete '/game_genres/:id/?' do
    gameGenre = GameGenre.find params[:id]
    gameGenre.destroy

    redirect '/game_genres/'
  end

  get '/game_genres/?' do
    @gameGenre = GameGenre.all
    haml :game_genre_index
  end

  get '/new_game_genre/?' do
    haml :new_game_genre
  end

  post '/new_game_genre/?' do
    GameGenre.create(params)

    redirect '/game_genres/'
  end
end
