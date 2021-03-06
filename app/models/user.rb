class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase}]).first
    else
      where(conditions.to_hash).first
    end
  end
end
