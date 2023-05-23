require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe "#create" do
    context '未ログインの場合' do
      it 'ログインページへリダイレクトされること' do
        post relationships_path
        expect(response).to redirect_to login_path
      end

      it '登録ができないこと' do
        expect {
          post relationships_path
        }.to_not change(Relationship, :count)
      end
    end

    context 'ログイン済みの場合' do
      let(:user) {FactoryBot.create(:user) }
      let(:other) {FactoryBot.create(:other) }


      it 'フォロワーが1件増えること' do
        log_in user
        expect {
          post relationships_path, params: { followed_id: other.id }
        }.to change(Relationship, :count).by 1
      end

      it 'Ajaxでも登録できること' do
        log_in user
        expect {
          post relationships_path, params: { followed_id: other.id }, xhr: true
        }.to change(Relationship, :count).by 1
      end
    end
  end

  describe '#destroy' do

    let(:user) {FactoryBot.create(:user) }
    let(:other) {FactoryBot.create(:other) }

    it 'フォロワーが1件減ること' do
      log_in user
      user.follow(other)
      relationship = user.active_relationships.find_by(followed_id: other.id)
      expect {
        delete relationship_path(relationship)
      }.to change(Relationship, :count).by -1
    end

    it 'Ajaxでも削除できること' do
      log_in user
      user.follow(other)
      relationship = user.active_relationships.find_by(followed_id: other.id)
      expect {
        delete relationship_path(relationship), xhr: true
      }.to change(Relationship, :count).by -1
    end
  end

end
