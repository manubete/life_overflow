require 'spec_helper'

describe "User can post a answer" do
  context "User logged into a question page" do
  let(:question) {FactoryGirl.create :question}
  let(:answer) {FactoryGirl.create :answer }
  let!(:user) {FactoryGirl.create :user }
    it "can submit answer for question and see answer on page" do
      ApplicationController.any_instance.stub(:current_user).and_return(user)

      visit question_path(:id => question.id)
      click_on 'new answer'
      fill_in 'answer[answer_content]', with: answer.answer_content
      click_on 'Submit'
      expect(page).to have_content answer.answer_content
    end
  end
end
