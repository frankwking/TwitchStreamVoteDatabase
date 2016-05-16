require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game_queues/:id/?' do
    @gameQueue = GameQueue.find params[:id]
    @games = @gameQueue.games
    haml :game_queue_show
  end

  get '/game_queues/?' do
    @gameQueue = GameQueue.all
    haml :game_queue_index
  end

  delete '/game_queues/:id/change_game/?' do
    GameQueue.find(params[:id]).games.destroy(Game.find(params[:game_id]))

    redirect '/game_queues/' + params[:id] +'/'
  end
end
