class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    sender = params[:sender]
    subject = params[:subject]
    body = params["body-plain"]

    if sender != nil
      sender = User.find_by_email(sender)
      sender_id = sender.id
      sender_id.save
    end

    if subject != nil
      subject = Topic.find_by_title("subject")
      subject_id = subject.id
      subject.save
    end

    if subject && sender
      body = body
      body.save
    end

    @bookmark = Bookmark.new(user_id = sender_id, topic_id = subject, url = body)
    @bookmark.save

    head 200
  end
end
