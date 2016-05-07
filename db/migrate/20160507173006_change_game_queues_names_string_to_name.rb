class ChangeGameQueuesNamesStringToName < ActiveRecord::Migration
  def change
    rename_column :game_queues, :names, :name
  end
end
