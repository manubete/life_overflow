require 'spec_helper'

describe "User can post a answer" do
  context "User logged into a question page" do
  let(:answer) {FactoryGirl.create :answer}
    it "can submit answer for question and see answer on page" do
      visit question_path # Check this out
      click_on 'Answer'
      fill_in 'answer[content]', with: answer.body
      click_on 'Submit'
      expect(page).to have_content answer.body
    end
  end
end
