class Comment < ActiveRecord::Base
  attr_accessible :comment_content
  belongs_to :commentable, :polymorphic => true
  belongs_to :question
end