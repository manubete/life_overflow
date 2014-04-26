require 'spec_helper'

describe CommentsController do
  let!(:comment) { FactoryGirl.create :comment }
  let!(:question) { FactoryGirl.create :question }
  # let!(:user) { FactoryGirl.create :user }

  context "new" do
    # context "logged in user" do
    #   before(:each) do
    #      session[:user_id] = 1
    #   end

      it "is successful" do
        get :new
        expect(response).to be_success
      end

      it "assigns @comment to the Question found by id" do
        get :new, { :commentable_id => question.id }
        expect(assigns(:comment)).to be_a_new Comment
      end
    end

    # context "guest user" do   ## TODO: CONNECT A COMMENT TO A USER ##
    #   before(:each) do
    #     session[:user_id] = nil
    #   end
    #   it "redirects a user to log in page if they are not logged in" do
    #     get :new, { :commentable_id => question.id }
    #     expect(response).to redirect_to root_path
    #   end
    # end
  # end

  # context "create" do
  #   context "logged in user" do
  #     before(:each) do
  #       session[:user_id] = 1
  #     end

  #     it "creates a new Comment" do
  #       expect {
  #       post :create, { :commentable_id => question.id, :comment_id => comment.id }
  #       }.to change { Comment.count }.by(1)
  #     end
  #   end
  # end
end