# require 'spec_helper'

#   describe VotesController do
#     context "#create" do
#       let(:vote_attributes) { FactoryGirl.attributes_for :vote }

#       it "creates an up vote for a question with valid attributes" do

#         expect {
#           post :create, :vote => vote_attributes
#         }.to change { Vote.count }.by(0)
#       end

#       # it "does not create an account with invalid attributes" do
#       #   expect {
#       #     post :create, :user => invalid_user
#       #   }.not_to change { User.count }
#       # end
#     end
#   end