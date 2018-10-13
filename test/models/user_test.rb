require "test_helper"

describe User do

  describe 'has relations' do
    it 'a user can have votes' do
      user = users.first
      work_first = works.first
      work_second = works.second

      vote = Vote.create!(user_id: user.id, work_id: work_first.id)
      vote = Vote.create!(user_id: user.id, work_id: work_second.id)
      two_votes = Vote.where(user_id: user.id)

      expect(two_votes.count).must_equal 2
    end
  end


end
