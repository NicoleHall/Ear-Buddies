require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "#show displays user info" do
    user = users(:one)
    session[:user_id] = user.id
    get :show

    assert_response :success
  end

  test "#redirect if no current user" do
    user = users(:one)
    get :show

    assert_response :found
  end
end
