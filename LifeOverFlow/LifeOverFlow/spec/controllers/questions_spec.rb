require 'spec_helper'

describe QuestionsController do
  let!(:user) { FactoryGirl.create :user }
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context "#new" do
    context "logged in user" do
      before(:each) do
         session[:user_id] = 1
      end
      it "is successful" do
        get :new
        expect(response).to be_success
      end

      it "shows a create question form if they are logged in" do
        get :new
        expect(response).to be_success
      end
    end

    context "guest user" do
      before(:each) do
        session[:user_id] = nil
      end
      it "redirects a user to log in page if they are not logged in" do
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  context "#create" do
    context "logged in user" do
      before(:each) do
         session[:user_id] = 1
      end
      let(:question) { FactoryGirl.attributes_for :question }
      it "creates with valid attributes" do
        expect {
          post :create, :question => question
        }.to change { Question.count }.by(1)
      end
    end

    # context "guest user" do
    #   before(:each) do
    #      session[:user_id] = nil
    #   end
    #   it "is successful" do
    #     post :create
    #     expect(response).to redirect_to root_path
    #   end
    # end

  end



  context "#edit" do

  end

  context "#show" do
    let(:question) { FactoryGirl.create :question }
    it "is successful" do
      get :show, :id => question.id
      expect(response).to be_success
    end

    it "assigns @question to the Question found by id" do
      get :show, :id => question.id
      expect(assigns(:question)).to eq question
    end
  end

  context "#destroy" do
    let!(:question) { FactoryGirl.create :question }
    it "destroys a question" do
      expect {
        delete :destroy, :id => question.id
      }.to change { Question.count }.by(-1)
    end
  end
end