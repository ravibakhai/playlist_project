class Playlist < ActiveRecord::Base
  validates :url, :description, :name, presence: true
  has_many :votes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
end
