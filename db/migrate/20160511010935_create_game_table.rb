class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :game do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
