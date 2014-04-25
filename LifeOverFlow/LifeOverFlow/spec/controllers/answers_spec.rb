require 'spec_helper'

describe AnswersController do
  let!(:question) { FactoryGirl.create :question}
  let!(:answer) { FactoryGirl.create :answer}
  let!(:answer_params) { FactoryGirl.attributes_for :answer}
  let!(:user) { FactoryGirl.create :user }

  context "#new" do
    context "logged in user" do
      before(:each) do
         session[:user_id] = 1
      end

      it "is successful" do
        get :new, {:question_id => question.id }
        expect(response).to be_success
      end
      it "assigns @answer to the Question found by id" do
        get :new, {:question_id => question.id, :id => answer.id }
        expect(assigns(:answer)).to be_a_new Answer
      end
    end

    context "guest user" do
      before(:each) do
        session[:user_id] = nil
      end
      it "redirects a user to log in page if they are not logged in" do
        get :new, {:question_id => question.id, :id => answer.id }
        expect(response).to redirect_to root_path
      end
    end
  end

  context "#create" do
    context "logged in user" do
      before(:each) do
         session[:user_id] = 1
      end
      it "is successful" do
        expect {
         post :create, {question_id: question.id, :answer => answer_params }
        }.to change {Answer.count}.by(1)
      end
    end

    # context "guest user" do
    #   before(:each) do
    #      session[:user_id] = nil
    #   end
    #   it "is successful" do
    #    expect {
    #      post :create, {question_id: question.id, :answer => answer_params }
    #     }.to redirect_to root_path
    #   end
    # end
  end

end