require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
   test "user can log out" do
    visit "/"
    click_link "Login"
    click_link "Logout"
    refute page.has_content?("Cole Mersich")
   end
end
