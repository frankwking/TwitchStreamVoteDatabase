class CreateVoteRecordTable < ActiveRecord::Migration
  def change
    create_table :vote_records do |t|
      t.belongs_to :game, index: true
      t.datetime :vote_record_date
      t.timestamps null: false
    end
  end
end
