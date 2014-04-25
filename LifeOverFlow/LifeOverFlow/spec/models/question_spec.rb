require 'spec_helper'

describe Question do
  context "Guest User" do
    it { should allow_mass_assignment_of :question_content}
    it { should validate_presence_of :question_content }
    it { should have_many(:answers)}
    it { should have_many (:comments)}
  end
end