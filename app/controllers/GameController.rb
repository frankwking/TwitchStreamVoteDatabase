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
