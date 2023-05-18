class User < ApplicationRecord
  has_many :beansposts, dependent: :destroy
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [200, 200]
  end

  attr_accessor :remember_token
  before_save  { email.downcase! }
  validates :name, presence: true, length: {maximum: 20}
  validates :nickname, presence: true, length: {maximum: 20, minimum:4}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true, confirmation: { type: :password, message: :confirmation}
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png], message: "その画像フォーマットは対応していません。"},
                      size: { less_than: 5.megabytes, message: "5メガバイト以下の画像のみアップロード可能です。"}


  # 渡された文字列のハッシュ値を返す
  def User.digest(string) # Userをselfに置き換える、または省略が可能
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token # Userをselfに置き換える、または省略が可能
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    remember_digest
  end

  # セッションハイジャック防止のためにセッショントークンを返す
  # この記憶ダイジェスト(remember_digest)を再利用しているのは単に利便性のため
  def session_token
    remember_digest || remember
  end

  # 渡されたトークンとダイジェストが一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Beanspost.where("user_id = ?", id)
  end
end
