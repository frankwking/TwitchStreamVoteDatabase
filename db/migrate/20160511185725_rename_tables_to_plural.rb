class RenameTablesToPlural < ActiveRecord::Migration
  def change
    rename_table :game, :games
    rename_table :game_console, :game_consoles
    rename_table :game_genre, :game_genres
  end
end
