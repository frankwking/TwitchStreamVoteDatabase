class RemoveGameQueueIntegerFromGameRecord < ActiveRecord::Migration
  def change
      remove_column :games, :game_queue
  end
end
