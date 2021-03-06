require 'test_helper'

class UserAddAPodcastToAPlaylistTest < ActionDispatch::IntegrationTest

  test "user can add a podcast to a playlist" do
    VCR.use_cassette('localhost') do
      user = users(:one)
      playlist = playlists(:one)

      assert_equal 3, User.find(1).podcasts.count
      result = create_podcast

      visit podcasts_search_path
      fill_in("podcast_subject[subject]", :with => 'dogs')
      click_button "Search"

      assert_equal podcasts_search_result_path, current_path

      first('.nothinghead').click_link('Add To Playlist')

      assert_equal new_podcast_path, current_path
      assert result.save
      assert_equal 4, User.find(1).podcasts.count
    end
  end
end
