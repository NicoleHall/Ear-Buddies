require 'test_helper'

class PodcastsControllerTest < ActionController::TestCase
  test "#search" do
    get :search
    assert_response :success
  end

end
