class PodcastsFinderController < ApplicationController

  def index
    @list_of_podcasts_by_subject = AudiosearchService.new.search_by_query(@podcast_subject)
  end

  def new
    @podcast_subject = Podcast.new
  end

  def create
    @podcast_subject = params["podcast"]["subject"]
    redirect_to podcasts_finder_index_path
  end

  private
  def podcasts_finder_params
    params.require(:podcasts_finder).permit(:subject)
  end


end
