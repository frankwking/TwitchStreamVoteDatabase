require 'sinatra/base'

class TwitchStreamVoteDatabase < Sinatra::Base
  get '/game/:id/?' do
    @game = Game.find params[:id]
    haml :game_show
  end

  get '/new_game/:name/?' do
    
  end
end
