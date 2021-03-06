require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/", current_path
    assert page.has_content?("Cole")
    assert page.has_link?("Logout")
  end

end
