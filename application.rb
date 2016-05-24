require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require_relative 'app/controllers/init'
require_relative 'app/models/init'
require 'tilt/haml'

class TwitchStreamVoteDatabase < Sinatra::Base
  set :environment, :development
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
  set :database, adapter: 'sqlite3', database: 'data.sqlite3'
  set :server, 'thin'
  set :views, File.dirname(__FILE__) + "/app/views"

  get '/' do
    haml :index
  end

end
