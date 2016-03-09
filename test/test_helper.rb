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

    User.create(
     id: 3,
     name: "Cole Hall",
     screen_name: "ColeMerscih",
     uid: "12345",
     image: "http://pbs.twimg.com/profile_images/610989157108707328/eiwDUICE_normal.jpg",
     oauth_token: 12345,
     oauth_token_secret: 12345)

    Playlist.create(
     id: 49,
     subject: "HotDogs#3",
     user_id: 3)
  end

  def create_podcast
     Podcast.new(
      ep_title: "Are Hot Dogs Sandwiches?",
      description:  "When it comes to the correct definition of a sandwich, I’m a strict constructionist.",
      date_created_at: "2014-06-26",
      show_title: "The Sporkful",
      url: "https://www.audiosear.ch/media/64eeb39222985854216d4418983b2a4c/0/public/audio_file/50866/.mp3",
      image: "https://s3.amazonaws.com/www-prod-popuparchive/the-sporkful.BACjFQ.popuparchive.org/thumb_mza_6297250918464517177.600x600-75.jpg?X-Amz-Expires=604800&X-Amz-Date=20160305T140233Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJ6B3Q7DFQGUS2TXQ/20160305/us-east-1/s3/aws4_request&X-Amz-SignedHeaders=host&X-Amz-Signature=651562e8e5f3954d4cab10cf094a9b26ba290039b3f00a3f5748ab5ad88fa23b",
      playlist_id: 45,
      audiosearch_id: 8001
    )
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
