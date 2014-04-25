class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :commentable_id
  belongs_to :commentable, :polymorphic => true
end