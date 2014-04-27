require 'spec_helper'

describe "A User can vote" do
  context "a signed in user can" do
    let(:question) {FactoryGirl.create :question}
    let!(:user) {FactoryGirl.create :user}
      it 'can vote up on a question' do
        ApplicationController.any_instance.stub(:current_user).and_return(user)
        visit root_path
        expect { click_on ".question#vote up" }.to change(question.votes_total).by(1)
      end
  end
end