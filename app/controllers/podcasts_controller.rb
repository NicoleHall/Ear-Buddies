class PodcastsController < ApplicationController

  def search

    #@podcast_subject = params["podcast"]["subject"]
  end

  def search_result
    subject = params["podcast_subject"]["subject"]
    @results = AudiosearchService.new.search_by_query(subject)
  end

end
