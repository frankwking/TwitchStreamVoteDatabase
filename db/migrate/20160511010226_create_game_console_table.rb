class CreateGameConsoleTable < ActiveRecord::Migration
  def change
    create_table :game_console do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
