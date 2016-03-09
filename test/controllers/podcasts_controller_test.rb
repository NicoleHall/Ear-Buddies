require 'test_helper'

class PodcastsControllerTest < ActionController::TestCase
  test "#search" do
    user = users(:one)
    session[:user_id] = user.id
    get :search
    assert_response :success
  end

  test "#new saves a selected podcast to database" do
    assert_difference 'Podcast.count', 1 do
    user = users(:one)
    session[:user_id] = user.id
    session[:playlist] = playlists(:two)
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
