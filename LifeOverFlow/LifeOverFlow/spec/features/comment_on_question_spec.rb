require 'spec_helper'

feature 'Comments' do
  context "user can post a comment on a question" do
    let(:question) { FactoryGirl.create :question }
    let(:comment) {FactoryGirl.create :comment }
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
    end

    # it "can click on Add Comment and create a comment" do
    #   visit question_path(:id => question.id)
    #   click_on "Create a Comment"
    #   fill_in 'comment[comment_content]', :with => comment[:comment_content]
    #   click_on 'Add Comment'
    #   expect(page).to have_content comment.comment_content
    # end
  end

end

