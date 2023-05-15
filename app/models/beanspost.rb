class Beanspost < ApplicationRecord
  belongs_to :user

  # 投稿の表示順を降順に指定
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
