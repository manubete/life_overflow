require 'spec_helper'

feature 'Guest users' do
  context "can create an account on the site" do
    let!(:user) { FactoryGirl.attributes_for :user }
    it "can go to the homepage, sees a Create Account button that leads to a Create Account form" do
      visit root_path
      click_on "Sign Up"
      expect(page).to have_content "Create an Account Below"
    end

    it "can fill out the Create an Account form and create an account" do
      visit new_user_path
      fill_in 'user[username]', :with => user[:username]
      fill_in 'user[email]', :with => user[:email]
      fill_in 'user[password]', :with => user[:password]
      click_on "Create Account"
      expect(page).to have_content User.last.username
    end
  end

  context "Guest user can't create questions or answers"  do
    let(:question) {FactoryGirl.create :question}
    let(:answer) {FactoryGirl.create :answer }

    it "can view questions but not create a new question" do
      visit root_path
      expect(page).to_not have_content "Create a Question"
    end

    it "can view questions but not create a new answer" do
      visit question_path(:id => question.id)
      expect(page).to_not have_content "Create an Answer"
    end

  end
end

feature 'Users' do
  context "User will see his user page only if (and only if) he is logged in" do
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      visit root_path
    end

    it "can go to the homepage, clicks on log in and enters his CORRECT credentials and is led to his user page" do
        expect(page).to have_content "#{user.username}"
    end
  end

  context "User can see the questions, comments and answers he made, on his homepage" do
    let!(:user) { FactoryGirl.create :user }
    let!(:question) { FactoryGirl.create :question, :user_id => user.id }
    let!(:answer) { FactoryGirl.create :answer, :user_id => user.id, :question_id => question.id }
    let!(:comment) { FactoryGirl.create :comment, :user_id => user.id, :question_id => question.id }

    before(:each) do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      visit user_path(user)
    end

    it "can go to his homepage and see the questions that he created" do
      expect(page).to have_content "#{question.question_title}"
    end
  end
end