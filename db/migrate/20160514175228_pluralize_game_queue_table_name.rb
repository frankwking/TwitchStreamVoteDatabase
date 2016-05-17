class PluralizeGameQueueTableName < ActiveRecord::Migration
  def change
    rename_table :game_queue, :game_queues
  end
end
