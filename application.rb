require 'sinatra/base'
require 'sinatra/activerecord'
require_relative 'db/models'
require_relative 'app/controllers/init'
require 'tilt/haml'

class TwitchStreamVoteDatabase < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
  set :database, adapter: 'sqlite3', database: 'data.sqlite3'
  set :server, 'thin'

  get '/' do
    haml :index
  end

end
