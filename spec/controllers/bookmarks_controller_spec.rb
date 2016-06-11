require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic, user: my_user) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic) }

  context "guest user" do
    describe "GET #show" do
      it "returns http redirect" do
        get :show, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "returns http redirect" do
        get :new, topic_id: my_topic.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "returns http redirect" do
        get :edit, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "signed in user" do

    before :each do
      @my_user = FactoryGirl.create(:user)
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:current_user).and_return(@my_user)
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, topic_id: my_topic.id, id: my_bookmark.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
