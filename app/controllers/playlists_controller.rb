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
    session[:playlist] = @playlist
  end

  def destroy
    Playlist.delete(params[:id])
    redirect_to playlists_path
  end
end
