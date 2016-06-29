class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create

    sender = params[:sender]
    user_id = User.find_by_email(sender)
    subject = params[:subject]
    body = params["body-plain"]

    puts "User: #{sender}"
    puts "User_id: #{user_id}"
    puts "Topic: #{subject}"
    puts "Body: #{body}"

  #  @bookmark = Bookmark.new(user_id = sender_id, topic = subject_id, url = body)
  #  @bookmark.save

    head 200
  end
end
