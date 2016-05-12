require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/games/:id/?' do
    @game = Game.find params[:id]
    haml :game_show
  end

  delete '/games/:id/?' do
    game = Game.find params[:id]
    game.destroy

    redirect '/games/'
  end

  get '/games/?' do
    @games = Game.all
    haml :game_index
  end

  get '/new_game/?' do
    @gameConsoles = GameConsole.all
    haml :new_game
  end

  post '/new_game/?' do
    Game.create(params)

    redirect '/games/'
  end
end
