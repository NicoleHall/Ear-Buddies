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

    params = {
      ep_title: "Dogs make much better pilots than Anton",
      description: "Mark Vette is one hell of a dog trainer.",
      date_created_at: "2016-03-04",
      show_title: "The Anton Savage Show",
      url: "https://www.audiosear.ch/media/84bda90877f838aca2831331d3e06403/0/public/audio_file/50801/50494_media_player_audio_file.mp3",
      image: "https://s3.amazonaws.com/www-prod-popuparchive/the-anton-savage-show.GeI1Lh.popuparchive.org/thumb_600x600bb.jpg?X-Amz-Expires=604800&X-Amz-Date=20160307T132851Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJ6B3Q7DFQGUS2TXQ/20160307/us-east-1/s3/aws4_request&X-Amz-SignedHeaders=host&X-Amz-Signature=3398093b60a7ff09720a0748da2e2c2f3665427171a944a5361f01bc3f4c128e" ,
      subject: "dogs",
      playlist_id: hotdogs_3.id
       }

       result = Podcast.create_podcast_on_a_playlist(params)
       assert result.save
  end
end
