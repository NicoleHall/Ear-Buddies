require 'test_helper'

class PlaylistsControllerTest < ActionController::TestCase
  test "#index" do
    session[:user_id] = users(:one).id
    get :index
    assert_response :success
    assert_equal ["arts and culture", "hotdogs"], Playlist.where(user_id: session[:user_id]).map(&:subject)
  end

  test "#show" do
    session[:user_id] = users(:one).id
    get :show, id: 45
    assert_response :success
    assert_equal "hotdogs", Playlist.find(45).subject
  end

  test "create adds a playlist to the database" do
    assert_difference 'Playlist.count', 1 do
      playlist = {:subject => "test_subject"}
      session[:user_id] = users(:one).id
      post :create, playlist: playlist
    end
  end
end
