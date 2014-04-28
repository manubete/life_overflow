class QuestionsController < ApplicationController
before_filter :require_login, only: [:new, :create]

  def index
    @questions = Question.all
    @question = Question.new
    @answer = Answer.new
    if params[:recent]
      @questions = Question.order(:created_at)
      render :partial => 'questions', :locals => {:questions => @questions}
    end
    if params[:upVotes]
        @questions = @questions.sort {|q1,q2| q2.votes_total <=> q1.votes_total}
        render :partial => 'questions', :locals => {:questions => @questions}
    end
  end

  def show
    @question = Question.find params[:id]
    @comment = Comment.new
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @answer = Answer.new
  end

  def create
    @question = Question.new params[:question]

    @user = current_user
    @question.update_attributes(:user_id => @user.id)

    if @question.save
      render :partial => 'question', :locals => {:question => @question}
    else
      render :text => @question.errors.full_messages.join(', '), :status => :failure
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
