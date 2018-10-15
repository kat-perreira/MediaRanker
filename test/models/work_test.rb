require "test_helper"

describe Work do

  # there are 2 vote objects created so I think/hope this is the correct way to write this test.
  describe 'relations' do

    it 'each work can have many votes' do
      votes = Vote.where(work_id: "haunting")
      expect(votes.count).must_equal 2
    end
  end

  describe 'validations' do

    before do
      @work = Work.new(
        title: 'test work'
      )
    end

    it 'is valid when title is present and unique' do

      is_valid = @work.valid?
      expect( is_valid ).must_equal true

    end

    it 'is invalid without a title' do
      @work.title = nil

      is_valid = @work.valid?

      expect( is_valid ).must_equal false
      expect( @work.errors.messages ).must_include :title
    end

    it 'is invalid with a non-unique title' do
      @work.title = Work.first.title

      is_valid = @work.valid?

      expect( is_valid ).must_equal false
      expect( @work.errors.messages ).must_include :title
    end

  end

  # testing the custom methods

  describe 'business methods' do

    before do
      @tester_one = User.create!(username: "sly")
      @tester_two = User.create!(username: "robbie")
      @test_work = Work.create!(title: "entroducing", category: "album")
      @vote_one = Vote.create!(user_id: @tester_one.id, work_id: @test_work.id)
      @vote_two = Vote.create!(user_id: @tester_two.id, work_id: @test_work.id)
    end

    # total_votes method
    it '#total_votes returns total votes for a work' do
      votes = @test_work.total_votes
      expect(votes).must_equal 2
    end

    # user_voters method
    it '#user_voters returns an array of users that voted' do
      user_array = @test_work.user_voters
      expect(user_array.length).must_equal 2

    end

    # upvoted_works method
    it '#upvoted_works returns a Vote object connected to itself' do
      votes = []
      votes << @vote_one.id

      test_vote = @test_work.upvoted_works(@tester_one.id)
      test_vote_ids = test_vote.ids

      expect(test_vote_ids).must_equal votes
    end




  end

end
