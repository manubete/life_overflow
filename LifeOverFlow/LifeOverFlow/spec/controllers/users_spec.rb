require 'spec_helper'

describe UsersController do
  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:valid_user) { FactoryGirl.attributes_for :user }
    let(:invalid_user) { FactoryGirl.attributes_for :user, :email => nil }

    it "creates an account with valid attributes" do
      expect {
        post :create, :user => valid_user
      }.to change { User.count }.by(1)
    end

    it "does not create an account with invalid attributes" do
      expect {
        post :create, :user => invalid_user
      }.not_to change { User.count }
    end
  end

  context "#show" do
    let(:user) { FactoryGirl.create :user }
    it "is succesful" do
      get :show, :id => user.id
      expect(response).to be_success
    end

    it "assigns @user to the User found by id" do
      get :show, :id => user.id
      expect(assigns(:user)).to eq user
    end
  end

end