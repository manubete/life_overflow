class Answer < ActiveRecord::Base
  attr_accessible :answer_content, :user_id

  validates :answer_content, presence: true
  belongs_to :user
  belongs_to :question
end