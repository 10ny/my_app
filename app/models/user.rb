class User < ApplicationRecord
  has_many :beansposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationship, class_name: :"Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationship, source: :follower #sourceは省略可

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [200, 200]
  end

  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest


  validates :name, presence: true, length: {maximum: 20}
  validates :nickname, presence: true, length: {maximum: 20, minimum:4}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true, confirmation: { type: :password, message: :confirmation}
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png], message: "その画像フォーマットは対応していません。"},
                      size: { less_than: 5.megabytes, message: "5MB以下の画像のみアップロード可能です。"}


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

  # ユーザのfollowingユーザおよび自分の投稿
  def feed
    following_ids =  "SELECT followed_id FROM relationships
                      WHERE  follower_id = :user_id"
    Beanspost.where( "user_id IN (#{following_ids})
                      OR user_id = :user_id", user_id: id)
                      .includes(:user, image_attachment: :blob)
  end

  # ユーザをフォローする
  def follow(other_user)
    following << other_user unless self == other_user
  end

  # ユーザのフォローを解除する
  def unfollow(other_user)
    following.delete(other_user)
  end

  # ユーザをフォローしていればtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  private
    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    #アカウント有効化トークンの作成と代入
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
