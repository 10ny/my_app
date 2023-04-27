require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(name: 'Example User', nickname: 'Tom', email: 'user@example.com')}

  it '#Userが有効であること' do
    expect(user).to be_valid
  end

  it '#名前が存在していること' do
    user.name = ' '
    expect(user).to_not be_valid
  end

  it '#ニックネームが存在していること' do
    user.nickname = ' '
    expect(user).to_not be_valid
  end

  it '#メールアドレスが存在していること' do
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

end
