class QuestionsController < ApplicationController
before_filter :require_login, only: [:new, :create]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
    @answer = Answer.new
    p "#{@answer}"
    p "#{@question}"
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    question = Question.find params[:id]
    question.destroy
    redirect_to root_path
  end


  def require_login
    puts current_user
    unless current_user
      flash[:error] = "You must be logged in to create a question"
      redirect_to root_path
    end
  end

end
