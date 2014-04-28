require 'spec_helper'

describe "A User can vote" do
  context "a signed in user can" do
    let(:question) {FactoryGirl.create :question}
    let!(:user) {FactoryGirl.create :user}
      it 'can vote up on a question' do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
         visit root_path
          click_on "Create a Question"
          fill_in 'question[question_title]', :with => question[:question_title]
          fill_in 'question[question_content]', :with => question[:question_content]
          click_on "Create Question"
          click_on "UP"
          expect(body).to have_content ("1")
      end
  end
end