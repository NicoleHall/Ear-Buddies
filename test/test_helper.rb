ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
puts "required simplecov"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'webmock/minitest'


class ActiveSupport::TestCase

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  VCR.configure do |config|
    config.ignore_localhost = true
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end

  def create_user_and_playlist
    cole = User.create(
      id: 3,
      name: "Cole Hall",
      screen_name: "ColeMerscih",
      uid: "12345",
      image: "http://pbs.twimg.com/profile_images/610989157108707328/eiwDUICE_normal.jpg",
      oauth_token: 12345,
      oauth_token_secret: 12345)

      hotdogs_3 = Playlist.create(
        id: 49,
        subject: "HotDogs#3",
        user_id: 3)
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = EarBuddies::Application
    stub_omniauth
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: 250190173,
      info: {
        name: "Cole Mersich",
        screen_name: "ColeMersich"
      },
      credentials: {
        token: ENV["oauth_token"],
        secret: ENV["oauth_token_secret"]
      }
    })
  end

end
