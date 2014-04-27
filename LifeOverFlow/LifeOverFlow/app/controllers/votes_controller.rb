class VotesController < ApplicationController

def create
  puts "INNNNNN"
  @vote = Vote.new(params)
  p @vote
  if @vote.save
    @vote
  else
    @vote.errors.full_messages
  end
end

end