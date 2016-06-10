class Bookmark < ActiveRecord::Base

  before_create :attach_http

  belongs_to :topic

  private

  def attach_http
    'http://' + url
  end
end
