class Bookmark < ActiveRecord::Base

  belongs_to :topic

  has_many :likes, dependent: :destroy

  validates :url, presence: true
  validates :topic, presence: true
end
