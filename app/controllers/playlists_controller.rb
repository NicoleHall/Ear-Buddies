class PlaylistsController < ApplicationController

  def new
    user = current_user
    #podcast = current_podcast
    @playlist = Playlist.new
  end
end
