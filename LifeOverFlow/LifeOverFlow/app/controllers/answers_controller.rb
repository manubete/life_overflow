class AnswersController < ApplicationController
before_filter :require_login, only: [:new, :create]
  def new
     @question = Question.find(params[:question_id])
     @answer = Answer.new
  end

  def create
    @user = current_user
    @question = Question.find params[:question_id]
    @answer = @question.answers.build params[:answer]
    @answer.update_attributes(:user_id => @user.id)
    if @answer.save
      redirect_to question_path(@question)
    else
      render :nothing => true
    end
  end

  def require_login
    puts current_user
    unless current_user
      flash[:error] = "You must be logged in to create a question"
      redirect_to root_path
    end
  end

end