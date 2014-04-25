require 'spec_helper'

describe Answer do
  context "Logged User" do
    it { should belong_to (:question)}
  end
end