require 'sinatra/base'
require 'sinatra/reloader'

class TwitchStreamVoteDatabase < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/games/:id/?' do
    @game = Game.find(params[:id])

    @current_queue_name = @game.game_queue.name
    @current_queue_id =@game.game_queue.id
    @current_votes = @game.current_votes.to_s

    @gameConsoles = GameConsole.all.order('name asc')
    @gameGenres = GameGenre.all.order('name asc')
    @gameQueues = GameQueue.all.order('name asc')

    haml :game_show
  end

  delete '/games/:id/?' do
    game = Game.find(params[:id])
    game.destroy

    redirect '/games/'
  end

  get '/games/?' do
    @games = Game.all
    haml :game_index
  end

  get '/new_game/?' do
    @gameConsoles = GameConsole.all.order('name asc')
    @gameGenres = GameGenre.all.order('name asc')
    @gameQueues = GameQueue.all.order('name asc')
    haml :new_game
  end

  post '/new_game/?' do
    game_console_id = params[:game_console_id]
    params.delete 'game_console_id'
    game_genre_id = params[:game_genre_id]
    params.delete 'game_genre_id'
    game = Game.create(params)
    game.game_consoles << GameConsole.find(game_console_id)
    game.game_genres << GameGenre.find(game_genre_id)
    redirect '/games/'
  end

  post '/games/:id/change_console/?' do
    Game.find(params[:id]).game_consoles << GameConsole.find(params[:game_console_id])
    redirect "/games/#{params[:id]}/"
  end

  delete '/games/:id/change_console/?' do
    Game.find(params[:id]).game_consoles.destroy(GameConsole.find(params[:game_console_id]))
    redirect "/games/#{params[:id]}/"
  end

  post '/games/:id/change_genre/?' do
    Game.find(params[:id]).game_genres << GameGenre.find(params[:game_genre_id])
    redirect "/games/#{params[:id]}/"
  end

  delete '/games/:id/change_genre/?' do
    Game.find(params[:id]).game_genres.destroy(GameGenre.find(params[:game_genre_id]))
    redirect "/games/#{params[:id]}/"
  end

  post '/games/:id/change_vote/?' do
    game = Game.find(params[:id])
    game.current_votes = params[:current_votes]
    game.save
    redirect "/games/#{params[:id]}/"
  end

  post '/games/:id/change_queue/?' do
    game = Game.find(params[:id])
    game.game_queue = GameQueue.find(params[:game_queue_id])
    game.save
    redirect "/games/#{params[:id]}/"
  end

end
