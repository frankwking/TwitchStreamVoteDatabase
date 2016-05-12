class VoteRecordRemoveOldBelongsTo < ActiveRecord::Migration
  def change
    remove_index  :vote_records, column: :game_id
    remove_column :vote_records, :game_id
  end
end
