class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :beanspost

  # 投稿の表示順を降順に指定
  default_scope -> { order(created_at: :desc) }

  # 一つのpostに同じuserが重複してlikeできないようにする
  validates :user_id, uniqueness: { scope: :beanspost_id }

end
