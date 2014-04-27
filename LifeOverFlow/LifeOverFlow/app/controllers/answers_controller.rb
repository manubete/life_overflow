class AnswersController < ApplicationController
before_filter :require_login, only: [:new, :create]

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.build params[:answer]
    if @answer.save
      render :partial => 'answer', :locals => {answer: @answer}
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