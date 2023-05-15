require 'rails_helper'

RSpec.describe Beanspost, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:beanspost) { user.beansposts.build(content: "美味しい豆です。") }

  it '有効であること' do
    expect(beanspost).to be_valid
  end

  it 'user_idが空白の場合は無効であること' do
    beanspost.user_id = nil
    expect(beanspost).to_not be_valid
  end

  it 'contentがからの場合は無効であること' do
    beanspost.content = '   '
    expect(beanspost).to_not be_valid
  end

  it '141文字以上の場合は無効であること' do
    beanspost.content = 'a' * 141
    expect(beanspost).to_not be_valid
  end

  it '投稿の並び順は新しいもの順になっていること' do
    FactoryBot.send(:user_with_posts)
    expect(FactoryBot.create(:most_recent)).to eq Beanspost.first
  end

  it 'ユーザが削除された場合、そのユーザのBeanspostも削除されていること' do
    post = FactoryBot.create(:most_recent)
    user = post.user
    expect {
      user.destroy
    }.to change(Beanspost, :count).by -1
  end
end
