class Beanspost < ApplicationRecord
  belongs_to :user

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [200, 200]
  end

  # 投稿の表示順を降順に指定
  default_scope -> { order(created_at: :desc) }

  # ラジオボタンの選択肢
  enum roast:   { chinamon: 0,  #浅煎り
                  medium: 1,    #中浅煎り
                  high: 2,      #中煎り
                  city: 3,      #中深煎り
                  fullcity: 4   #深煎り
                }
  
  validates :product_name, presence: true
  validates :shop_name, presence: true
  validates :roast, presence: true
  validates :country, presence: true
  validates :price,   numericality: true, inclusion: { only_integer: true, in: 100..10000 }
  validates :grams,   numericality: true, inclusion: { only_integer: true, in: 10..10000 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png], message: "その画像フォーマットは対応していません。"}, size: { less_than: 5.megabytes, message: "5メガバイト以下の画像のみアップロード可能です。" }


  def self.human_attribute_enum_value(attr_name, value)
    return if value.blank? # valueが空欄の場合は明示的にリターン
    human_attribute_name("#{attr_name}.#{value}") # 日本語化された値がかえる
  end

  def enum_name(attr_name) # カラム名を引数で渡す
    self.class.human_attribute_enum_value( attr_name, self.send("#{attr_name}") ) # sendでカラムの値を取得
  end

end
