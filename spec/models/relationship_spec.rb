require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  
  describe 'follow と unfollow' do
    let(:user) { FactoryBot.create(:user) }
    let(:other) { FactoryBot.create(:other) }

    it 'followするとfollowing?がtrueになること' do
      expect(user.following?(other)).to_not be_truthy
      user.follow(other)
      expect(user.following?(other)).to be_truthy
    end

    it 'unfollowするとfollowing?がfalseになること' do
      user.follow(other)
      expect(user.following?(other)).to_not be_falsey
      user.unfollow(other)
      expect(user.following?(other)).to be_falsey
    end
  end
end
