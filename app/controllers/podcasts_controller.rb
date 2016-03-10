class PodcastsController < ApplicationController
  before_action :store_query, only:[:search_result]

  def search

  end

  def search_result

    @results = AudiosearchService.new.search_by_query(params["podcast_subject"]["subject"])
  end

  def new
    if current_user.playlists.empty?
      flash[:notice] = "Create A Playlist!"
      redirect_to new_playlist_path
    else
      @podcast = Podcast.create_podcast_on_a_playlist(params['podcast'].merge({
        playlist_id: current_playlist.id}))
      if @podcast.save
        redirect_to playlist_path(@podcast.playlist)
      else
        flash[:notice] = "Fail Whale!"
        redirect_to new_playlist_path
      end
    end
  end

  def show
    begin
      @podcast = Podcast.find(params["id"]) || nil
      @related = AudiosearchService.new.search_by_related(@podcast.audiosearch_id)
    rescue ActiveRecord::RecordNotFound
      redirect_to podcasts_search_path
    end
  end

  def create
  end

  def destroy
    playlist_id = Playlist.find(session[:playlist]["id"]).id
    Podcast.delete(params["id"])
    redirect_to playlist_path(playlist_id)
  end

  private
    def store_query
      session[:subject] ||= params["podcast_subject"]["subject"]
    end

end
