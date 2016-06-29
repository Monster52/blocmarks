class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create

    sender = params[:sender]
    subject = params[:subject]
    body = params["body-plain"]

    puts "#{sender}"
    puts "#{sender_id}"

  #  @bookmark = Bookmark.new(user_id = sender_id, topic = subject_id, url = body)
  #  @bookmark.save

    head 200
  end
end
