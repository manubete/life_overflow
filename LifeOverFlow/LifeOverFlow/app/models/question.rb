require 'date'

class Question < ActiveRecord::Base
  attr_accessible :question_content, :question_title, :user_id

  validates :question_content, presence: true
  validates :question_title, presence: true
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :answers
  has_many :votes, :as => :voteable

  def votes_total
    total_up_votes = self.votes.find_all_by_vote_type('up').count
    total_down_votes = self.votes.find_all_by_vote_type('down').count
    votes_total = total_up_votes - total_down_votes
  end

  t = Time.new
  DateTime.strptime(t,'%s').strftime("%d %m %y")

end

