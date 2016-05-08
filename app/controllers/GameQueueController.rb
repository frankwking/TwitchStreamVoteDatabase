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

  get '/game_queues/?' do
    @gameQueue = GameQueue.all
    haml :game_queue_index
  end
end
