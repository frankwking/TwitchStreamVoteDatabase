class VoteRecordBelongsToGames < ActiveRecord::Migration
  def change
    change_table :vote_records do |t|
      t.belongs_to :games, index: true
    end
  end
end
