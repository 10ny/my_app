class Beanspost < ApplicationRecord
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [200, 200]
  end

  # 投稿の表示順を降順に指定
  default_scope -> { order(created_at: :desc) }
  
  validates :product_name, presence: true

  validates :country, presence: true
  validates :price,   numericality: true, inclusion: { only_integer: true, in: 100..10000 }
  validates :grams,   numericality: true, inclusion: { only_integer: true, in: 10..10000 }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png], message: "その画像フォーマットは対応していません。"},
                      size: { less_than: 5.megabytes, message: "5メガバイト以下の画像のみアップロード可能です。" }
end
