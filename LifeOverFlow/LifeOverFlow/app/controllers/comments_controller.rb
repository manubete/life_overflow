class CommentsController < ApplicationController

  def new
    # @question = Question.find(params[:question_id])
    if params[:question_id]  != nil
      @comment = Comment.new(:commentable_id => params[:question_id], :commentable_type => "Question")
    else
      @comment = Comment.new(:commentable_id => params[:answer_id], :commentable_type => "Answer")
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.commentable_type == "Question"
      @question = Question.find(params[:comment][:commentable_id])
      @question.comments << @comment
      if @comment.save
        redirect_to question_path(@question)
      else
        render :new
      end
    else
      @answer = Answer.find(params[:comment][:commentable_id])
      @question = Question.find(@answer.question_id)
      @answer.comments << @comment
      if @comment.save
        redirect_to question_path(@question)
      else
        render :new
      end
    end
  end

end