class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  validates :nickname, presence: true, length: {maximum: 20, minimum:3}
  validates :email, presence: true, length: {maximum: 20}
end
