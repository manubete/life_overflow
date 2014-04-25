class Question < ActiveRecord::Base
  attr_accessible :question_content

  validates :question_content, presence: true
  has_many :comments, :as => :commentable
  has_many :answers

end