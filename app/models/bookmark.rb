class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :beanspost

  # 一つのpostに同じuserが重複してlikeできないようにする
  validates :user_id, uniqueness: { scope: :beanspost_id }

end
