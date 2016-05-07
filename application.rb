require 'sinatra/base'
require 'sinatra/activerecord'
require_relative 'db/models'
require_relative 'app/controllers/init'
require 'tilt/haml'

class TwitchStreamVoteDatabase < Sintra::Base
  register Sinatra::ActiveRecordExtension
  use Rack:MethodOverrid
  set :database, adapter: 'sqlite3', database: 'data.sqlite3'
  set :server, 'thin'
  
end

get '/' do
  haml :index
end
