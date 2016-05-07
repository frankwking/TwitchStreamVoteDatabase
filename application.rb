require 'sinatra'
require 'tilt/haml'

$num_players = 0
$player_list = []

get '/' do
  haml :index
end
