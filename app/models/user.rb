class User < ApplicationRecord
  before_save  { email.downcase! }
  validates :name, presence: true, length: {maximum: 20}
  validates :nickname, presence: true, length: {maximum: 20, minimum:4}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, confirmation: { type: :password, message: :confirmation}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
