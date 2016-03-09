require 'test_helper'

class UserAddAPodcastToAPlaylistTest < ActionDispatch::IntegrationTest

  test "user can add a podcast to a playlist" do
    VCR.use_cassette('localhost') do
      create_user_and_playlist
      assert_equal 2, User.find(1).podcasts.count
      result = Podcast.new(
      ep_title: "Are Hot Dogs Sandwiches?",
      description:  "When it comes to the correct definition of a sandwich, I’m a strict constructionist.",
      date_created_at: "2014-06-26",
      show_title: "The Sporkful",
      url: "https://www.audiosear.ch/media/64eeb39222985854216d4418983b2a4c/0/public/audio_file/50866/.mp3",
      image: "https://s3.amazonaws.com/www-prod-popuparchive/the-sporkful.BACjFQ.popuparchive.org/thumb_mza_6297250918464517177.600x600-75.jpg?X-Amz-Expires=604800&X-Amz-Date=20160305T140233Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJ6B3Q7DFQGUS2TXQ/20160305/us-east-1/s3/aws4_request&X-Amz-SignedHeaders=host&X-Amz-Signature=651562e8e5f3954d4cab10cf094a9b26ba290039b3f00a3f5748ab5ad88fa23b",
      playlist_id: 45,
      audiosearch_id: 8001
      )
      assert_equal 0, Playlist.find(49).podcasts.count
      visit podcasts_search_path
      fill_in("podcast_subject[subject]", :with => 'dogs')
      click_button "Search"
      assert_equal podcasts_search_result_path, current_path
      first('.nothinghead').click_link('Add To Playlist')
      assert_equal new_podcast_path, current_path
      assert result.save
      assert_equal 3, User.find(1).podcasts.count
    end
  end
end
