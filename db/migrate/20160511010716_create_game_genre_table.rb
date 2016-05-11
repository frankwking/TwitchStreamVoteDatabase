class CreateGameGenreTable < ActiveRecord::Migration
  def change
    create_table :game_genre do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
