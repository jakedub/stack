class Question < ApplicationRecord
  paginates_per 10
  has_many :answers
  belongs_to :user
  has_many :votes
end
