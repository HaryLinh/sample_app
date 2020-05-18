class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.reg.email
  USER_PARAMS = [:name, :email, :password, :password_confirmation].freeze
  before_save  :email_downcase
  validates :name, presence: true, length: { maximum: Settings.name.maximum }
  validates :email, format: { with: VALID_EMAIL_REGEX },
                             presence: true, uniqueness: true, length: { maximum: Settings.email.maximum }

  validates :password, presence: true, length: { minimum: Settings.password.minimum }

  has_secure_password
  private
  def email_downcase
    email.downcase!
  end
end
