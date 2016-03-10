require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
  test "create_podcast_on_a_playlist method on model" do
    cole = User.create(
      id: 3,
      name: "Cole Hall",
      screen_name: "ColeMerscih",
      uid: "12345",
      image: "http://pbs.twimg.com/profile_images/610989157108707328/eiwDUICE_normal.jpg",
      oauth_token: 12345,
      oauth_token_secret: 12345)

      hotdogs_3 = Playlist.create(
        id: 49,
        subject: "HotDogs#3",
        user_id: 3)

      podcast = podcasts(:podcast_without_a_playlist)

       result = Podcast.create_podcast_on_a_playlist(podcast), ({ playlist_id: 49 })
       assert result.first.save
       assert_equal "Listen to Major Jackson Read", result.first.ep_title
  end
end
