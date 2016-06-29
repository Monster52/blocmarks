class TopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Your Topic Saved."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was a problem, try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(wiki_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "You Topic has been updated."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an Error editing your Topic."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "Topic '#{@topic.title}' was deleted."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was a Error deleting your Topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
