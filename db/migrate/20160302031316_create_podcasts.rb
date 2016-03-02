class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :ep_title
      t.string :description
      t.string :date_created_at
      t.string :show_title
      t.string :url
      t.string :image

      t.timestamps null: false
    end
  end
end
