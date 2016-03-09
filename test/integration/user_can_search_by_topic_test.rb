require 'test_helper'

class UserCanSearchByTopicTest < ActionDispatch::IntegrationTest
  test "user can search podcast by topic" do
    visit "/"
    click_link "Login"
    click_link "Create A Playlist"
    fill_in("playlist[subject]", with: "dogs")
    click_button("Create Your Playlist")
    click_link "Search"

    assert_equal 200, page.status_code
    assert_equal podcasts_search_path, current_path
    assert page.has_content?("What subject would you like to search")

    fill_in("podcast_subject[subject]", :with => 'dogs')
    click_button "Search"

    assert_equal podcasts_search_result_path, current_path
  end
end
