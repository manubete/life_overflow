class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @user_questions = @user.questions
    @user_answers = @user.answers
    @user_comments = @user.comments
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

end