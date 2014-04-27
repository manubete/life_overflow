class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @user = current_user
    @comment.update_attributes(:user_id => @user.id)

    if @comment.commentable_type == "Question"
      if @comment.save
        render :partial => 'comment_on_question', :locals => {:comment => @comment}
      else
        render :new
      end
    else
      if @comment.save
        render :partial => 'comment_on_answer', :locals => {:comment => @comment}
      else
        render :new
      end
    end
  end

end