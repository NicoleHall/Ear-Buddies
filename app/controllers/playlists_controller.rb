class PlaylistsController < ApplicationController
  #before_action :selector, except: :show, except: :new, except: :create
  before_action :selector, only: [:edit]

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

private
  def selector
    playlist = Playlist.find(params[:id])
    session[:playlist] = playlist
    if playlist.podcasts == []
      redirect_to podcasts_search_path
    else
    redirect_to :controller=>'podcasts',:action=>'search_result'
    # redirect_to podcasts_search_result_path, action: 'POST'
    end
  end
end
