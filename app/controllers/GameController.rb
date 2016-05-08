require 'sinatra/base'

class TwitchStreamVoteDatabase < Sinatra::Base
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
