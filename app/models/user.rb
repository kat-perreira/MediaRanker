class User < ApplicationRecord
  has_many :votes
  validates :username, presence: true, uniqueness: true


  # create a vote object with current user's id and the work id passed in
  def vote(work_id)
    vote = Vote.where(user_id: self.id, work_id: work_id)
    return vote
  end

  # Assign the list of votes to the variable votes_array...helper method
  def users_votes
    votes_array = Vote.where(user_id: self.id)
    return votes_array
  end

  # collect the work ids for all the works that the user upvoted
  def upvoted
    votes = users_votes
    upvoted_workids = []
    votes.each do |vote|
      upvoted_workids << vote
    end
    return upvoted_workids
  end

  # return the works users voted on here, not in the view.

  def user_voted_works
    work_ids = upvoted
    works = []
    work_ids.each do |id|
      work = Work.find_by(id: id)
      works << work
    end
    return works
  end


end
