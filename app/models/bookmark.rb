class Bookmark < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, use: [:slugged, :history]

  belongs_to :topic

  has_many :likes, dependent: :destroy

  validates :url, presence: true
  validates :topic, presence: true
end
