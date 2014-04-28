require 'spec_helper'

feature 'Questions' do

  context "User can click on Show on the homepage to see the question's page" do
    let!(:question) { FactoryGirl.create :question }
    # it "successfully renders template to show question" do
    #   visit root_path
    #   click_on "Show"
    #   expect(page).to have_content question.question_content
    # end
  end



end