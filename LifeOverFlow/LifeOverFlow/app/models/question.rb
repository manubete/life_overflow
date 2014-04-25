class Question < ActiveRecord::Base
  attr_accessible :question_content

  validates :question_content, presence: true

end