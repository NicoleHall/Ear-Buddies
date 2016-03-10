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

  test "#new will redirect to new playlist path if current user has no playlist" do
    user = users(:two)
    session[:user_id] = user.id
    get :new
    assert_redirected_to new_playlist_path
  end

  test "#new if podcast not created it will redirect to new playlist" do
    user = users(:one)
    session[:user_id] = user.id
    session[:playlist] = playlists(:two)
    get :new, podcast: {}
    assert_redirected_to new_playlist_path
  end

  test "#show will redirect to search if podcast doesn't exist" do
    user = users(:one)
    get :show, id: 1
    assert_redirected_to :controller => "podcasts", :action => "search"

  end

  test "#show will succeed when podcast exists" do
    VCR.use_cassette("podcast_controller#show") do
      user = users(:one)
      podcast = podcasts(:one)

      get :show, id: podcast.id
      assert_response :success
   end
  end

  test "#destroy on success will redirect to playlists" do
    session[:playlist] = playlists(:one)
    delete :destroy, id: 22
    assert_redirected_to :controller => "playlists", :action => "show"
  end

end
