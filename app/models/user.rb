class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_many :answers
  has_many :questions
  has_many :votes

  private

  def downcase_email
    email.downcase if email
  end
end
