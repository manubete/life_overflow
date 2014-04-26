require 'spec_helper'

feature 'Questions' do
  context "User can create a question from the homepage" do
    let!(:question) { FactoryGirl.attributes_for :question }
    let!(:user) { FactoryGirl.create :user }
    it "can go to the homepage, sees a Create Question button that leads to a Create Question form" do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      visit root_path
      click_on "Create a Question"
      fill_in 'question[question_title]', :with => question[:question_title]
      fill_in 'question[question_content]', :with => question[:question_content]
      click_on "Create Question"
      expect(page).to have_content Question.last.question_content
    end

    # it "can click on Create Question and create a question" do
    #   ApplicationController.any_instance.stub(:current_user).and_return(user)

    #   visit new_question_path
    #   fill_in 'question[question_title]', :with => question[:question_title]
    #   fill_in 'question[question_content]', :with => question[:question_content]
    #   click_on "Create Question"
    #   expect(page).to have_content Question.last.question_content
    # end
  end

  context "User can click on Show on the homepage to see the question's page" do
    let!(:question) { FactoryGirl.create :question }
    it "successfully renders template to show question" do
      visit root_path
      click_on "Show"
      expect(page).to have_content question.question_content
    end
  end

  context "User can click on Delete on the homepage to delete the question" do
    let!(:question) { FactoryGirl.create :question }
    it "successfully deletes the question" do
      visit root_path
      click_on "Delete"
      expect(page).to_not have_content question.question_content
    end
  end

end