class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  private

  def downcase_email
    email.downcase if email
  end
end
