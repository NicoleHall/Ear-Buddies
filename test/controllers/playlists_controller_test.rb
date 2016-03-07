require 'test_helper'

class PlaylistsControllerTest < ActionController::TestCase
  test "#index" do

    current_user = User.find(1)

    get :index
    assert_response :success

  end
end
