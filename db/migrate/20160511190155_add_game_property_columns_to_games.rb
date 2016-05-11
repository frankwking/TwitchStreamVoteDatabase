class AddGamePropertyColumnsToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.integer   :current_votes
      t.integer   :game_progress
      t.integer   :game_queue
      t.integer   :hours_to_beat
      t.string    :vote_command
      t.string    :vote_file_name
      t.boolean   :is_blind_playthrough
    end
  end
end
