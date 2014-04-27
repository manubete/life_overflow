class VotesController < ApplicationController



def create
  vote_params = {vote_type: params[:vote_type], voteable_type: params[:voteable_type], voteable_id: params[:voteable_id] }
  @vote = Vote.new(vote_params)
  p @vote
  if @vote.save
    @vote
  else
    @vote.errors.full_messages
  end
end

end