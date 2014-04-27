class Vote < ActiveRecord::Base
  attr_accessible :vote_type, :voteable_id, :voteable_type

  belongs_to :user
  belongs_to :voteable, :polymorphic => true

end