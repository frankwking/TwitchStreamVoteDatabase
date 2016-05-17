class MakeGameBelongToGameQueue < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.belongs_to :game_queue, index: true
    end
  end
end
