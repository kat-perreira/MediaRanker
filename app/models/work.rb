class Work < ApplicationRecord

  has_many :votes

  validates :title, presence: true, uniqueness: true

  def total_votes
    votes = self.votes.count
    return votes
  end

  # similar but opposite of the user model. refactor this
  def user_voters
    votes = self.votes
    user_ids = []

    votes.each do |vote|
      user_ids << vote.user_id
    end

    users = []
    user_ids.each do |num|
      user = User.find_by(id: num)
      users << user
    end

    return users
  end

  def upvoted_works(user_id)
    vote = Vote.where(user_id: user_id, work_id: self.id)
    return vote
  end

end
