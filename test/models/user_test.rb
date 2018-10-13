require "test_helper"

describe User do

# relation tests: a user has many votes
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

# Validation tests for unique and present username
  describe 'validations' do
    before do
      @user = User.new(
        username: 'Riley'
      )
    end

    it 'is valid when a username is present' do
      is_valid = @user.valid?
      expect ( is_valid ).must_equal true
    end

    it 'is invalid with a non-unique username' do
      @user.username = User.first.username

      is_valid = @user.valid?

      expect( is_valid ).must_equal false
      expect( @user.errors.messages ).must_include :username
    end

    it 'is invalid without a username' do
      @user.username = nil

      is_valid = @user.valid?

      expect( is_valid ).must_equal false
      expect( @user.errors.messages ).must_include :username
    end



  end

end
