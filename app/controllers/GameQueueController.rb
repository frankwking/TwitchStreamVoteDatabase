require 'sinatra/base'

class TwitchStreamVoteDatabase < Sinatra::Base
  get '/game_queue/:id/?' do
    @gameQueue = GameQueue.find params[:id]
    haml :game_queue_show
  end
end
