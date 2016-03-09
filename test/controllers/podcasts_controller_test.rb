require 'test_helper'

class PodcastsControllerTest < ActionController::TestCase
  test "#search" do
    get :search
    assert_response :success
  end

  test "#new saves a selected podcast to database" do
    assert_difference 'Podcast.count', 1 do
      session[:playlist] = podcasts(:two)#$.id
    podcast = { ep_title: "New Episode",
      description: "Something",
      date_created_at: "2015-04-14",
      show_title: "This Week In Startups",
      url: "url.com",
      image: "png.png",
      subject: "food",
      playlist_id: 45,
      audiosearch_id: 16891
    }

    post :new, podcast: podcast
   end
  end

end


# test "#create adds a playlist to the database" do
#   assert_difference 'Playlist.count', 1 do
#     playlist = {:subject => "test_subject"}
#     session[:user_id] = users(:one).id
#     post :create, playlist: playlist
#   end
# end


# Podcast id: nil, ep_title: nil, description: nil, date_created_at: nil, show_title: nil, url: nil, image: nil, created_at: nil, updated_at: nil, subject: nil, playlist_id: nil, audiosearch_id: nil
