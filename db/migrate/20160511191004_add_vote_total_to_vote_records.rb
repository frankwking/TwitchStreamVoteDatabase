class AddVoteTotalToVoteRecords < ActiveRecord::Migration
  def change
    add_column :vote_records, :vote_total, :integer
  end
end
