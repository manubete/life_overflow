require 'spec_helper'

describe QuestionsController do
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context "#new" do
    let!(:user) { FactoryGirl.create :user }
    it "is successful" do
      session[:user_id] = 1
      get :new
      expect(response).to be_success
    end

    it "shows a create question form if they are logged in" do
      session[:user_id] = 1
      get :new
      expect(response).to be_success
    end

    it "redirects a user to log in page if they are not logged in" do
      session[:user_id] = nil
      get :new
      expect(response).to redirect_to root_path
    end

  end

  context "#create" do
    let(:question) { FactoryGirl.attributes_for :question }
    it "creates with valid attributes" do
      expect {
        post :create, :question => question
      }.to change { Question.count }.by(1)
    end
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