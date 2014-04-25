class AnswersController < ApplicationController

  def new
     @question = Question.find(params[:question_id])
     @answer = Answer.new
  end

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.build params[:answer]
    puts "---HERE IS ANSWER______"
    puts @answer.inspect
    if @answer.save
      redirect_to question_path(@question)
    else
      render :nothing => true
    end
  end

end