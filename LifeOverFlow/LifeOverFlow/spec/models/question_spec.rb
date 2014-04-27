require 'spec_helper'

describe Question do
  context "Guest User" do
    it { should allow_mass_assignment_of :question_content}
    it { should validate_presence_of :question_content }
    it { should have_many(:answers)}
    it { should have_many (:comments)}
  end

  context "Should have many votes" do
    it { should have_many (:votes)}
  end
end


describe '#votes_total' do

  context "one vote for a question" do
    # let(:vote) {FactoryGirl.create :vote}
    # let(:question) {FactoryGirl.create :question}
    # # expect { vote.question.votes_total }.to eq(1)
    # question.votes << vote
  end
end

