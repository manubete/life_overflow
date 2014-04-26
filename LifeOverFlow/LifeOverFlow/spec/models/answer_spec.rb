require 'spec_helper'

describe Answer do
  context "Logged User" do
    it { should belong_to (:question)}
  end
  context "Should have many comments" do
    it { should have_many(:comments) }
  end
end