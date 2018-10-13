class User < ApplicationRecord
  has_many :votes
  validates :username, presence: true, uniqueness: true


  # I think business logic for voting goes here, connected with the user
  def vote(work_id)
    vote =Vote.where(user_id: self.id, work_id: work_id)
    return vote
  end

  # broke this apart
  def users_votes
    votes_array = Vote.where(user_id: self.id)
    return votes_array
  end

  def upvoted
    votes = users_votes
    upvoted_workids = []
    votes.each do |vote|
      upvoted_workids << vote
    end
    return upvoted_workids
  end


end
