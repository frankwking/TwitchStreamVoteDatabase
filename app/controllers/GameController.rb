require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game/:id/?' do
    @game = Game.find params[:id]
    haml :game_show
  end

  delete '/game/:id/?' do
    Game.find(params[:id]).destroy

    @games = Game.all
    haml :game_index
  end

  get '/new_game/?' do
    haml :new_game
  end

  post '/new_game/?' do
    Game.create(params)

    @games = Game.all
    haml :game_index
  end

  get '/games/?' do
    @games = Game.all
    haml :game_index
  end
end
