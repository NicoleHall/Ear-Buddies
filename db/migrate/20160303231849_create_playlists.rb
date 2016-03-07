class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :subject
      t.references :user, index: true, foreign_key: true
      t.references :podcast, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
