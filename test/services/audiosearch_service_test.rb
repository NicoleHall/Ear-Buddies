require './test/test_helper'

class AudiosearchServiceTest < ActiveSupport::TestCase

  test "#initialize" do
    VCR.use_cassette('as_service#initialize') do
      result = AudiosearchService.new
      assert_equal "https://www.audiosear.ch", result.client.host
    end
  end

  test "#search_by_query" do
    VCR.use_cassette('as_service#search_by_query') do
      as = AudiosearchService.new
      result = as.search_by_query("food")

      assert_equal "Food, Power and Punishment", result.first[:ep_title]
      assert_equal "2016-02-27", result.first[:date_created_at]
      assert_equal "Nothing", result.first[:description][0..6]
      assert_equal "The Food Chain", result.first[:show_title]
      assert_equal "https://s3.amazonaws.com/www-prod-popuparchive/the-food-chain.QCwwGR.popuparchive.org/thumb_600x600bb.jpg?X-Amz-Expires=604800&X-Amz-Date=20160302T132004Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJ6B3Q7DFQGUS2TXQ/20160302/us-east-1/s3/aws4_request&X-Amz-SignedHeaders=host&X-Amz-Signature=c3afba493c21ab8a498e216795a4a54e573d4216eca7e5a56d45d77a13bd286d", result.first[:image]
      assert_equal "food", result.first[:subject]
    end
  end

  test "#search_by_related" do
    VCR.use_cassette('as_service#search_by_related') do
      as = AudiosearchService.new
      result = as.search_by_related("8000")
      assert_equal 4, result.count
      assert_equal "E533: Michael Robertson @mp3michael - Founder & CEO, DAR.fm @digitalaudiorec", result.first[:ep_title]
      assert_equal "2015-04-14", result.first[:date_created_at]
      assert_equal "This Week In Startups", result.first[:show_title]
      assert_equal "https://i1.sndcdn.com/avatars-000112553274-ygfl2h-large.jpg", result.first[:image]
      assert_equal "https://www.audiosear.ch/media/00340b8c6f37f8fda0a2bc3462f6ba09/0/public/audio_file/4791/stream.mp3", result.first[:url]
    end
  end

end
