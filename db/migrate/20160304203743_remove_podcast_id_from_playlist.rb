class RemovePodcastIdFromPlaylist < ActiveRecord::Migration
  def change
    remove_column :playlists, :podcast_id
  end
end
