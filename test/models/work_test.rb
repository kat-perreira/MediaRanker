require "test_helper"

describe Work do

  # Testing the relationship: one test for work to many relationship
  # describe 'relations' do
  #
  #   it "has a vote" do
  #     b = Work.first
  #     vote = b.vote
  #     expect(vote).must_be_instance_of Vote
  #   end
  # end

  # Tests validations for presence and uniqueness
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

end





# Book must be of type Book
# a new book instance if of type Book
