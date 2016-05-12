class FixGameGenresGamesAssociations < ActiveRecord::Migration
  def change
    remove_index  :game_genres_games, column: :game_genres_id
    remove_index  :game_genres_games, column: :games_id
    remove_column :game_genres_games, :game_genres_id
    remove_column :game_genres_games, :games_id
    change_table :game_genres_games do |t|
      t.belongs_to :game_genre, index: true
      t.belongs_to :game, index: true
    end
  end
end
