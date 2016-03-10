class Podcast < ActiveRecord::Base
  belongs_to :playlist

 validates :audiosearch_id, presence: true

  def self.create_podcast_on_a_playlist(params)
    podcast = self.new({
      audiosearch_id: params["audiosearch_id"],
      ep_title: params["ep_title"],
      description: params["description"],
      date_created_at: params["date_created_at"],
      show_title: params["show_title"],
      url: params["url"],
      image: params["image"],
      subject: params["subject"],
      playlist_id: params["playlist_id"]
      })
  end
end
