class Comment < ActiveRecord::Base
  attr_accessible :comment_content
  belongs_to :commentable, :polymorphic => true
end