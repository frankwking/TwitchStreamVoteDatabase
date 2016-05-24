require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game_genres/:id/?' do
    @gameGenre = GameGenre.find(params[:id])
    @game = @gameGenre.games.order('name asc')
    haml :game_genre_show
  end

  delete '/game_genres/:id/?' do
    gameGenre = GameGenre.find(params[:id])
    gameGenre.destroy

    redirect '/game_genres/'
  end

  get '/game_genres/?' do
    @gameGenre = GameGenre.all.order('name asc')
    haml :game_genre_index
  end

  get '/new_game_genre/?' do
    haml :new_game_genre
  end

  post '/new_game_genre/?' do
    GameGenre.create(params)

    redirect '/game_genres/'
  end

  delete '/game_genres/:id/change_game/?' do
    GameGenre.find(params[:id]).games.destroy(Game.find(params[:game_id]))

    redirect "/game_genres/#{params[:id]}/"
  end

end
