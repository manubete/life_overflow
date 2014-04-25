require 'spec_helper'

feature 'Guest users' do
  context "Guest user can create an account on the site" do
    let!(:user) { FactoryGirl.attributes_for :user }
    it "can go to the homepage, sees a Create Account button that leads to a Create Account form" do
      visit root_path
      click_on "Create an Account"
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

  feature 'Users' do
    context "User will see his user page only if (and only if) he is logged in" do
      let!(:user) { FactoryGirl.create :user }
      let(:session) { FactoryGirl.create :session, :id => user.id }
      it "can go to the homepage, clicks on log in and enters his CORRECT credentials and is led to his user page" do
        visit root_path
        click_on "Log In"
        fill_in "Email", :with => user.email
        fill_in 'Password', :with => user.password
        click_on "Log in"
        expect(page).to have_content "#{user.username}"
      end
    end
  end
end