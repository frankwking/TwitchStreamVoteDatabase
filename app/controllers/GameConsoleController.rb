require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/game_consoles/:id/?' do
    @gameConsole = GameConsole.find params[:id]
    haml :game_console_show
  end

  delete '/game_consoles/:id/?' do
    gameConsole = GameConsole.find params[:id]
    gameConsole.destroy

    redirect '/game_consoles/'
  end

  get '/game_consoles/?' do
    @gameConsole = GameConsole.all
    haml :game_console_index
  end

  get '/new_game_console/?' do
    haml :new_game_console
  end

  post '/new_game_console/?' do
    GameConsole.create(params)

    redirect '/game_consoles/'
  end
end
