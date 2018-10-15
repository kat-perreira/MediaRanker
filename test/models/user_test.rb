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
        username: 'Bob'
      )
    end

    it 'is valid when a username is present' do
      is_valid = @user.valid?
      expect (is_valid).must_equal true
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

  # business methods for vote(work_id), users_votes, upvoted, user_voted_works
  describe 'business methods' do

    before do
      @test_user = users(:Kat)
      @test_work_1 = works(:Haunting)
      @test_work_2 = works(:Shrek)
      @test_vote_1 = Vote.create!(user_id: @test_user.id, work_id: @test_work_1.id)
      @test_vote_2 = Vote.create!(user_id: @test_user.id, work_id: @test_work_2.id)
    end

    it '#vote(work_id) returns a vote object with a specific work id' do
      vote = @test_user.vote(@test_work_1.id)
      id = vote.first.id
      vote_id = @test_vote_1.id

      expect(vote_id).must_equal id
    end

    it '#users_votes returns an array of votes' do
      ids = @test_user.users_votes

      expect (ids.count).must_equal 2

    end

    it '#upvoted returns an array of work ids' do
      work_ids = @test_user.upvoted
      expect(work_ids.length).must_equal 2
    end

  end


end
