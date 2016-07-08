class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: {minimum: 3}, presence: true



end
