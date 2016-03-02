require 'audiosearch'

# create a client

class AudiosearchService

  attr_reader :client

   def initialize
     @client = Audiosearch::Client.new(
      :id     => "f097ffdbbc1027171a83c2107985ce365cccaee57321e633bcbba83d7086c388",
      :secret => "d933dcdaccd6a97a5937bfa409e910326927ceff96be1df0f020cd4362eb5c4d",
      :host   => 'https://www.audiosear.ch/',
      :debug  => false,
    )
   end

  def search_by_query(query)
    response = client.search({ q: "#{query}" })
    response.results.each do |episode|
      episode.title
    end
  end

end
