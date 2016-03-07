require 'audiosearch'

# create a client

class AudiosearchService

  attr_reader :client

   def initialize
     @client = Audiosearch::Client.new(
      :id     => ENV['audiosearch_id'],
      :secret => ENV['audiosearch_secret'],
      :host   => 'https://www.audiosear.ch/',
      :debug  => false,
    )
   end

  def search_by_query(query)
    response = client.search({ q: "#{query}" })
    episodes = []

    response.results.each do |episode|

     episodes << {
        ep_title: episode["title"],
        description: episode["description"] ? episode["description"] : nil,
        date_created_at: episode["date_created"],
        show_title: episode["show_title"],
        url: episode["audio_files"] ? episode['audio_files'][0]["mp3"] : nil,
        image: episode["image_urls"] ? episode["image_urls"]["thumb"] : nil,
        subject: "#{query}"
      }

    end
    episodes
  end

end


#learned about safe navigation operator from will
#if stuff on left side of questin mark evaluates to true,
#then execute code on the right side of the ? before the colon
#if stuff on left side of questin mark evaluates to false,
#set the value of the key to nil
