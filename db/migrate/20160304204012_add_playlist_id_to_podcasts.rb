class AddPlaylistIdToPodcasts < ActiveRecord::Migration
  def change
    add_reference :podcasts, :playlist, index: true
  end
end
