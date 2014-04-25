class Answer < ActiveRecord::Base
  attr_accessible :answer_content

  validates :answer_content, presence: true
  belongs_to :question
end