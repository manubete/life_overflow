require 'date'

class Question < ActiveRecord::Base
  attr_accessible :question_content, :question_title, :user_id

  validates :question_content, presence: true
  validates :question_title, presence: true
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :answers

  def timestamp_to_time(timestamp)
    now = Time.now
    p "$"*50
    puts now
    p "$"*50
    Time.at(1234567890).strftime("%m/%d/%Y")
    DateTime.strptime(Time.now.utc.to_i.to_s,'%s').strftime("%d/%m/%y ")
  end

end

