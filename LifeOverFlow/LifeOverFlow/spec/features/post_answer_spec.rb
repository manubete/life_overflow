require 'spec_helper'

describe "User can post a answer" do
  context "User logged into a question page" do
  let(:question) {FactoryGirl.create :question}
  let(:answer) {FactoryGirl.create :answer }
    it "can submit answer for question and see answer on page" do
      visit question_path(:id => question.id) # Check this out
      click_on 'Answer'
      fill_in 'answer[answer_content]', with: answer.answer_content
      click_on 'Submit'
      expect(page).to have_content answer.answer_content
    end
  end
end
