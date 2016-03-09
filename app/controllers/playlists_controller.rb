class PlaylistsController < ApplicationController

  def index
    if is_there_a_playlist?
      @playlists = current_user.playlists
    else
      redirect_to new_playlist_path
    end
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
