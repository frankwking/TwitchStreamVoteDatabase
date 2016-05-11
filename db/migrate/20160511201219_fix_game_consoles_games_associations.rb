class FixGameConsolesGamesAssociations < ActiveRecord::Migration
  def change
    remove_index  :game_consoles_games, column: :game_consoles_id
    remove_index  :game_consoles_games, column: :games_id
    remove_column :game_consoles_games, :game_consoles_id
    remove_column :game_consoles_games, :games_id
    change_table :game_consoles_games do |t|
      t.belongs_to :game_console, index: true
      t.belongs_to :game, index: true
    end
  end
end
