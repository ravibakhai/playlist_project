class Playlist < ActiveRecord::Base
  validates :url, :image, :description, :name, presence: true
end
