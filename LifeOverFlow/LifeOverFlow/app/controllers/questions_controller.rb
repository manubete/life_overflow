class QuestionsController < ApplicationController
before_filter :require_login, only: [:new, :create]

  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find params[:id]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]
    if @question.save
      render :partial => 'question', :locals => {:question => @question}
    else
      render :text => @question.errors.full_messages.join(', '), :status => :unprocessable_entity
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
