class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_playlist

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_playlist
    if session[:playlist]
      @playlist = Playlist.find(session[:playlist]["id"])
    elsif current_user && current_user.playlists.count == 1
      @playlist = current_user.playlists.first
    end
  end

end
