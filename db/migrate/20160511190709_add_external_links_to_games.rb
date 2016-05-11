class AddExternalLinksToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.string  :wikipedia_link
      t.string  :metacritic_link
      t.string  :how_long_to_beat_link
      t.string  :youtube_playlist_link
    end
  end
end
