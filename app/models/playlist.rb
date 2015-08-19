class Playlist < ActiveRecord::Base
  validates :url, :name, presence: true
  has_many :reviews
  has_many :votes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  belongs_to :user
end
