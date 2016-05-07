class CreateTableOfGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :created_at
      t.integer :votes
      t.integer :year
    end
  end
end
