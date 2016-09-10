require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic, user: my_user) }

  context 'guest user' do
    describe "GET #index" do
      it "returns http redirect" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #show" do
      it "returns http redirect" do
        get :show, {id: my_topic.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "returns http redirect" do
        get :edit, {id: my_topic.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'signed in user' do

    before :each do
      @my_user = FactoryGirl.create(:user)
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:current_user).and_return(@my_user)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {id: my_topic.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {id: my_topic.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "create" do
      it "returns http redirect" do
        new_title = "This is a new Title"
        new_body = "This is a new body for test"

        put :create, id: my_topic.id, topic: { title: new_title, body: new_body }, user_id: @my_user.id
        expect(response).to redirect_to(topics_path)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, {id: my_topic.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "update" do
      it "returns http redirect" do
        new_title = "This is a new title update"
        new_body = "This is a new body for updating"

        put :update, id: my_topic.id, topic: { title: new_title, body: new_body }, user_id: @my_user.id
        expect(response).to redirect_to(topics_path)
      end
    end

    describe "destroy" do
      it "returns http redirect" do
        delete :destroy, {id: my_topic.id}
        expect(response).to redirect_to(topics_path)
      end
    end
  end
end
