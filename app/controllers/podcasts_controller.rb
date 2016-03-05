class PodcastsController < ApplicationController
  before_action :set_playlist, only:[:search_result, :new, :destroy]
  before_action :store_query, only:[:search_result]

  def search
    #@podcast_subject = params["podcast"]["subject"]
  end

  def search_result
    # session[:subject] = params["podcast_subject"]["subject"]
    @results = AudiosearchService.new.search_by_query(params["podcast_subject"]["subject"])
  end


  def new
    # args = {}.merge(params).merge
    @podcast = Podcast.create_podcast_on_a_playlist(params.merge({
      playlist_id: @playlist.id}))
    if @podcast.save
      redirect_to playlist_path(@podcast.playlist)
    else
      flash[:notice] = "Fail Whale"
    end
  end

  def create
  end

  def show
  end

  def destroy
    playlist_id = Playlist.find(session[:playlist]["id"]).id
    Podcast.delete(params["id"])
    redirect_to playlist_path(playlist_id)
  end

  private
  def set_playlist
    @playlist = Playlist.find(session[:playlist]["id"]) if session[:playlist]
    @playlist ||= "No playlist"
  end

  def store_query
    session[:subject] ||= params["podcast_subject"]["subject"]
  end

end
