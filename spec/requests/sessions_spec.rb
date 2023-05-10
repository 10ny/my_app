require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let (:base_title) {"Serve"}

  describe '#get login' do
    it 'HTTPレスポンスを正常に返すこと login' do
      get login_path
      expect(response).to have_http_status :ok
    end

    it 'ログイン | Serve が含まれていること' do
      get login_path
      expect(response.body).to include "ログイン | #{base_title}"
    end
  end

  describe '#delete logout' do
    before do 
      user = FactoryBot.create(:user)
      post login_path, params: { session: { email: user.email,
                                            password: user.password } }
    end

    it 'ユーザがログアウトできること' do
      expect(is_logged_in?).to be_truthy

      delete logout_path
      expect(is_logged_in?).to_not be_truthy
    end

    it '2回続けてログアウトしてもエラーにならないこと' do
      delete logout_path
      delete logout_path
      expect(response).to redirect_to root_path
    end
  end

  describe '#create' do
    let(:user) { FactoryBot.create (:user) }
    describe 'remember' do
      it 'オンの時はcookies[:remember_token]が空ではないこと' do
        post login_path, params: { session: { email: user.email,
                                              password: user.password,
                                              remember_me: 1 } }
        expect(cookies[:remember_token]).to_not be_blank
      end

      it 'オフの時はcookies[:remember_token]が空であること' do
        post login_path, params: { session: { email: user.email,
                                              password: user.password,
                                              remember_me: 0 } }
        expect(cookies[:remember_token]).to be_blank
      end
    end
  end
end
