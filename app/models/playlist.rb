class Playlist < ActiveRecord::Base
  validates :url, :description, :name, presence: true
  has_many :reviews
end
