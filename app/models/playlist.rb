class Playlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :podcast
end