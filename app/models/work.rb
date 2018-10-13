class Work < ApplicationRecord

  has_many :votes, dependent: :nullify

   validates :title, presence: true, uniqueness: true



   def all_votes


   end









end
