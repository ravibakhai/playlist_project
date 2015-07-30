class Playlist < ActiveRecord::Base
  validates :url, :description, :name, presence: true
end
