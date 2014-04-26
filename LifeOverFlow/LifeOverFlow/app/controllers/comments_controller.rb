class CommentsController < ApplicationController

  def new
    @comment = Comment.new(:commentable_id => params[:question_id])
  end

  def create
    @question = Question.find(params[:comment][:commentable_id])
    @comment = Comment.new(params[:comment])
    @question.comments << @comment
    if @comment.save
      redirect_to question_path(@question)
    else
      render :new
    end

  end

end