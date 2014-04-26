class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :commentable_id, :commentable_type, :user_id
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
end