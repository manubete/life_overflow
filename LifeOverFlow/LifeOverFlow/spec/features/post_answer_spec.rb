require 'spec_helper'

describe "User can post a answer", :js => true do
  context "User logged into a question page" do
  let(:question) {FactoryGirl.create :question}
  let(:answer) {FactoryGirl.create :answer }
  let!(:user) {FactoryGirl.create :user }
    it "can submit answer for question and see answer on page" do
      visit root_path
      click_on "Log In"
      fill_in 'email', :with => user.email
      fill_in 'password', :with => user.password
      click_on 'Log in'

      visit question_path(:id => question.id)

      click_on 'Create an Answer'
      fill_in 'answer[answer_content]', with: answer.answer_content
      click_on 'Submit'
      expect(page).to have_content answer.answer_content
    end
  end
end
