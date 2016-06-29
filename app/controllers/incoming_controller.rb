class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    @subject = Incoming.new(params[:subject])
    @subject.save

    @sender = params[:from]
    @sender.save
    @body = params[:'body-plain']
    @body.save

    #@bookmark = Bookmark.new = parms **

    head 200
  end
end
