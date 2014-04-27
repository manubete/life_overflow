require 'spec_helper'

feature 'Comments' do
  context "user can post a comment on a answer" do
    let(:answer) {FactoryGirl.create :answer}
    let(:comment) {FactoryGirl.create :comment }
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
    end

    # it "can click on Add Comment and create a comment for an answer" do
    #   visit question_path(answer.question)
    #   click_on "Comment on Answer"
    #   fill_in 'comment[comment_content]', :with => comment[:comment_content]
    #   click_on 'Add Comment'
    #   expect(page).to have_content comment.comment_content
    # end
  end

end

