class Vote < ActiveRecord::Base
  attr_accessible :type

  belongs_to :user
  belongs_to :voteable, :polymorphic => true

end