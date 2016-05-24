require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game_queues/:id/?' do
    @gameQueue = GameQueue.find(params[:id])
    @games = @gameQueue.games.order('current_votes desc')
    @gameQueues = GameQueue.all.order('name asc')
    haml :game_queue_show
  end

  get '/game_queues/?' do
    @gameQueue = GameQueue.where(display: true).order('name asc')
    haml :game_queue_index
  end

  post '/game_queues/:id/change_game/?' do
    gameQueue = GameQueue.find(params[:game_queue_id])
    gameQueue.games << Game.find(params[:game_id])
    gameQueue.save

    redirect '/game_queues/' + params[:id] +'/'
  end
end
