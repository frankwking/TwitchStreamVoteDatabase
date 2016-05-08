require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game_queue/:id/?' do
    @gameQueue = GameQueue.find params[:id]
    haml :game_queue_show
  end

  delete '/game_queue/:id/?' do
    gameQueue = GameQueue.find params[:id]
    gameQueue.destroy

    redirect '/game_queues/'
  end

  get '/game_queues/?' do
    @gameQueue = GameQueue.all
    haml :game_queue_index
  end

  get '/new_game_queue/?' do
    haml :new_game_queue
  end

  post '/new_game_queue/?' do
    GameQueue.create(params)

    redirect '/game_queues/'
  end
end
