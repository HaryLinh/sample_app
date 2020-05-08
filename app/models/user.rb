class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.reg.email
  before_save  :email_downcase
  validates :name, presence: true, length: { maximum: Settings.name.maximum }

  validates :email, presence: true, length: { maximum: Settings.email.maximum },
    format: { with: VALID_EMAIL_REGEX },uniqueness: true

  has_secure_password

  validates :password, presence: true, length: { maximum: Settings.password.minimum }
  private
  def email_downcase
    email.downcase!
  end
end
