class CreateGameGenreGameJoinTable < ActiveRecord::Migration
  def change
    create_table :game_genres_games, id: false do |t|
      t.belongs_to :game_genres, index: true
      t.belongs_to :games, index: true
      t.timestamps null: false
    end
  end
end
