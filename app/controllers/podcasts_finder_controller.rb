class PodcastsFinderController < ApplicationController

  # def index
  #
  #   @list_of_podcasts_by_subject = AudiosearchService.new.search_by_query(@podcast_subject)
  # end
  #
  # def new
  #   @podcast_subject = Podcast.new
  # end
  #
  # def create
  #   @podcast_subject = params["podcast"]["subject"]
  #
  # end

  private
  def podcasts_finder_params
    params.require(:podcasts_finder).permit(:subject)
  end


end
