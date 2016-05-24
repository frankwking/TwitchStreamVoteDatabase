class AddDisplayBoolToGameQueues < ActiveRecord::Migration
  def change
    add_column :game_queues, :display, :boolean, default: true, null: false
  end
end
