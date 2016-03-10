require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
  test "#create podcast on a playlist" do
    user = users(:one)
    playlist = playlists(:two)
    podcast = podcasts(:podcast_without_a_playlist)

     result = Podcast.create_podcast_on_a_playlist(podcast), ({ playlist_id: 49 })
     assert result.first.save
     assert_equal "Listen to Major Jackson Read", result.first.ep_title
  end
end
