class VotesController < ApplicationController



def create
  vote_params = {vote_type: params[:vote_type], voteable_type: params[:voteable_type], voteable_id: params[:voteable_id] }
  @vote = Vote.new(vote_params)
  if @vote.save
    question = Question.find(@vote.voteable_id)
    @vote_total = question.votes_total
    @vote_total
    render json: @vote_total.to_json
  else
    @errors = @vote.errors.full_messages
  end
end

end