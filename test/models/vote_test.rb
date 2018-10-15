require "test_helper"

describe Vote do

  # relations: user has many votes, work has many votes. These are same/similar tests from users and works relations tests, I was unsure what to put here actually.
  describe 'relations' do

    it 'a work has many votes' do
      votes = Vote.where(work_id: "haunting")
      expect(votes.count).must_equal 2
    end

    it 'a user has many votes' do
      votes = Vote.where(user_id: "Riley")
      expect(votes.count).must_equal 2
    end

  end


end
