require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new( name: 'Example User', nickname: 'Tomy', email: 'user@example.com', password: 'foobarbaz', password_confirmation: 'foobarbaz' ) }

  it 'Userが有効であること' do
    expect(user).to be_valid
  end

  it '名前が存在していること' do
    user.name = ' '
    expect(user).to_not be_valid
  end

  it 'ニックネームが存在していること' do
    user.nickname = ' '
    expect(user).to_not be_valid
  end

  it 'メールアドレスが存在していること' do
    user.email = ' '
    expect(user).to_not be_valid
  end

  it '名前が長すぎないこと' do
    user.name = 'a' * 21
    expect(user).to_not be_valid
  end

  it 'ニックネームが長すぎないこと' do
    user.nickname = 'a' * 21
    expect(user).to_not be_valid
  end

  it 'ニックネームが短かすぎないこと' do
    user.nickname = 'a' * 2
    expect(user).to_not be_valid
  end

  it 'メールアドレスが長すぎないこと' do
    user.email = "#{'a' * 244}@example.com"
    expect(user).to_not be_valid
  end

  it 'メールアドレスが有効な形式であること' do
    valid_addresses = %w[user@exmple.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it '無効な形式のメールアドレスは失敗すること' do
    invalid_addresses = %W[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid
    end
  end

  it 'メールアドレスは重複して登録できないこと' do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it 'メールアドレスは小文字でDBに保存されていること' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    user.email = mixed_case_email
    user.save
    expect(user.reload.email).to eq mixed_case_email.downcase
  end

  it 'パスワードが空白でないこと' do
    user.password = user.password_confirmation = ' ' * 8
    expect(user).to_not be_valid
  end

  it 'パスワードが5文字以上であること' do
    user.password = user.password_confirmation = 'a' * 7
    expect(user).to_not be_valid
  end

  describe '#autenticated?' do
    it 'digestが空白の場合はfalseを返すこと' do
      expect(user.authenticated?(:remember, '')).to be_falsy
    end
  end


  describe '#feed' do
    let(:posted_by_user) { FactoryBot.create(:post_by_user) }
    let(:posted_by_another) { FactoryBot.create(:post_by_another) }
    let(:posted_by_other) { FactoryBot.create(:post_by_other) }
    let(:user) { posted_by_user.user }
    let(:another) { posted_by_another.user }
    let(:other) { posted_by_other.user }
  
    before do
      user.follow(another)
    end
  
    it 'フォローしているユーザの投稿が表示されること' do
      another.beansposts.each do |post_following|
        expect(user.feed.include?(post_following)).to be_truthy
      end
    end
  
    it '自分自身の投稿が表示されること' do
      user.beansposts.each do |post_self|
        expect(user.feed.include?(post_self)).to be_truthy
      end
    end
  
    it 'フォローしていないユーザの投稿は表示されないこと' do
      other.beansposts.each do |post_unfollowed|
        expect(user.feed.include?(post_unfollowed)).to be_falsey
      end
    end
  end
end
