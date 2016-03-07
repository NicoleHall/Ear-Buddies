require 'test_helper'

class UserCanCreatePlaylistTest < ActionDispatch::IntegrationTest

  test "user can create a playlist" do
    VCR.use_cassette('localhost') do

      visit "/"
      assert_equal 200, page.status_code
      click_link "Login"
      click_link "Search"
      fill_in("podcast_subject[subject]", :with => 'dogs')
      click_button "Search"
      save_and_open_page
      click_on('Create Playlist')

      fill_in("playlist[subject]", :with => 'dogs')
      click_button("Create Your Playlist")
      assert_equal playlists_path, current_path

      assert page.has_content?("dogs")
    end
  end
end
