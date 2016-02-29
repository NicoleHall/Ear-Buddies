require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
   test "user can log out" do
    visit "/"
    click_link "login"
    click_link "logout"
    refute page.has_content?("Cole Mersich")
   end
end
