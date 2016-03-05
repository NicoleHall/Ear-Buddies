class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlists
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(subject: params["playlist"]["subject"], user_id: current_user.id)
    redirect_to playlists_path
  end

  def edit
  end

  def show
    @playlist = Playlist.find(params["id"])
  end

  def selector
    playlist = Playlist.find(params[:playlist])
    session[:playlist] = playlist
    redirect_to :controller=>'podcasts',:action=>'search_result'
    # redirect_to podcasts_search_result_path, action: 'POST'
  end
end
