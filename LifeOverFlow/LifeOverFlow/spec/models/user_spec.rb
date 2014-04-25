require 'spec_helper'

describe User do
  context "User creating an acount" do
    it { should allow_mass_assignment_of :username }
    it { should allow_mass_assignment_of :email }
    it { should allow_mass_assignment_of :password }
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
  end
end