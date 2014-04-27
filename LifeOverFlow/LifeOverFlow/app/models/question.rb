class Question < ActiveRecord::Base
  attr_accessible :question_content, :question_title, :user_id

  validates :question_content, presence: true
  validates :question_title, presence: true
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :answers

end