class AddSubjectToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :subject, :string
  end
end
