require 'spec_helper'

describe AnswersController do
  let!(:question) { FactoryGirl.create :question}
  let!(:answer) { FactoryGirl.create :answer}
  let!(:answer_params) { FactoryGirl.attributes_for :answer}

  context "#new" do
    it "is successful" do
      get :new, {:question_id => question.id }
      expect(response).to be_success
    end
    it "assigns @answer to the Question found by id" do
      get :new, {:question_id => question.id, :id => answer.id }
      expect(assigns(:answer)).to be_a_new Answer
    end
  end

  context "#create" do
    it "is successful" do
      expect {
       post :create, {question_id: question.id, :answer => answer_params }
      }.to change {Answer.count}.by(1)
    end
  end

end