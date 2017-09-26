class Question < ApplicationRecord
  paginates_per 50
  has_many :answers
  belongs_to :user
end
