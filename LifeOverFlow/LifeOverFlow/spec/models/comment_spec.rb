require 'spec_helper'

describe Comment do
  context "Logged In User" do
    it { should allow_mass_assignment_of :comment_content }
  end
end