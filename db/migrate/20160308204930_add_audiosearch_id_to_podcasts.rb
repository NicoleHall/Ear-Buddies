class AddAudiosearchIdToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :audiosearch_id, :integer
  end
end
