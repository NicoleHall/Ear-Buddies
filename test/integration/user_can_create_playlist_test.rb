require 'test_helper'

class UserCanCreatePlaylistTest < ActionDispatch::IntegrationTest

  test "user can create a playlist" do
    VCR.use_cassette('localhost') do
      visit "/"
      click_link "Login"
      click_link "Search"
      fill_in("podcast_subject[subject]", :with => 'dogs')
      click_button "Search"
      click_on('Create Playlist')
      fill_in("playlist[subject]", :with => 'dogs')
      click_button("Create Your Playlist")

      assert_equal playlists_path, current_path
      assert page.has_content?("dogs")
    end
  end
end
