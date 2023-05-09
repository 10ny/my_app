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
    it 'ユーザがログアウトできること' do
      user = FactoryBot.create(:user)
      post login_path params: { session: {  email: user.email,
                                            password: user.password } }
      expect(is_logged_in?).to be_truthy

      delete logout_path
      expect(is_logged_in?).to_not be_truthy
    end
  end
end
