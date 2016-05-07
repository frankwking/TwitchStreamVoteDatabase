class CreateTableOfGameQueues < ActiveRecord::Migration
  def change
    create_table :game_queues do |t|
      t.string :names
      t.datetime :created_at
    end
  end
end
