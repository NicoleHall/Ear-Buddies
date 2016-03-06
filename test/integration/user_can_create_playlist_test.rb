require 'test_helper'

class UserCanCreatePlaylistTest < ActionDispatch::IntegrationTest
   test "user can create a playlist" do
     visit "/"
     assert_equal 200, page.status_code
     click_link "Login"
     click_link "Search"
     fill_in("podcast_subject[subject]", :with => 'dogs')
     click_button "Search"

     click_button 'Create Playlist'
     fill_in("Playlist name", :with => 'dogs')
     click_link("Create Your Playlist")
     assert_equal playlists_path, current_path

     assert page.has_content?("dogs")
     #fill_in("podcast_subject[subject]", :with => 'dogs')
  #   assert true
  end
end
