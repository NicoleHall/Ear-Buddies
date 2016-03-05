class CreatePodcastPlaylists < ActiveRecord::Migration
  def change
    create_table :podcast_playlists do |t|
      t.integer :podcast_id
      t.integer :playlist_id

      t.timestamps null: false

    end
  end
end
