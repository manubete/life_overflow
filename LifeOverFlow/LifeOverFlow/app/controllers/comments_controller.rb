class CommentsController < ApplicationController

  def new
    #@question = Question.find(params[:question_id])
    @comment = Comment.new(:commentable_id => params[:question_id])
  end

  def create
    p "#{params}"
    p "$"*50
    @question = Question.find(params[:comment][:commentable_id])
    p "#{@question}"
     @comment = Comment.new(params[:comment])

     @question.comments << @comment
     p "#{@comment.commentable_id}"
    if @comment.save
      redirect_to question_path(@question)
    else
      render :new
    end

  end

end