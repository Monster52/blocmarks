class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create

    sender = params[:sender]
    user = User.find_by_email(sender)
    user_id = user.id

    subject = params[:subject]
    topic = Topic.find_by_title(subject)
    topic_id = topic.id

    body = params["body-plain"]

    puts "User: #{sender}"
    puts "User_id: #{user_id}"
    puts "Topic: #{subject}"
    puts "Body: #{body}"

    @bookmark = Bookmark.new(user_id = user_id, topic = topic_id, url = body)
    @bookmark.save

    head 200
  end
end
