require './test/test_helper'

class AudiosearchServiceTest < ActiveSupport::TestCase

  test "#initialize" do
    VCR.use_cassette('as_service#initialize') do
      assert AudiosearchService.new
    end
  end

  test "#search_by_query" do
    VCR.use_cassette('as_service#search_by_query') do
      as = AudiosearchService.new
      result = as.search_by_query("food")

      assert_equal "Food, Power and Punishment", result.first["title"]
      assert_equal "2016-02-27", result.first["date_created"]
      result.first["digital_location"]
    end
  end
end
