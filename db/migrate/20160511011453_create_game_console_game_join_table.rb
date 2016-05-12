class CreateGameConsoleGameJoinTable < ActiveRecord::Migration
  def change
    create_table :game_consoles_games, id: false do |t|
      t.belongs_to :game_consoles, index: true
      t.belongs_to :games, index: true
      t.timestamps null: false
    end
  end
end
