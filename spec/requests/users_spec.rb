require 'rails_helper'

RSpec.describe "Users", type: :request do
  let (:base_title) {"Serve"}

  describe '#signup' do
    it 'HTTPレスポンスを正常に返すこと User Signup' do
      get signup_path
      expect(response).to have_http_status :ok
    end

    it '新規登録 | Serve が含まれていること' do
      get signup_path
      expect(response.body).to include "新規登録 | #{base_title}"
    end
  end

  describe '#post /users #create' do
    it '無効なユーザーは登録されないこと' do
      expect {
        post users_path, params: { user: { name: "",
                                          nickname: "Jun",
                                          email: "user@invalid",
                                          password: "foo",
                                          password_confirmation: "bar" }}
      }.to_not change(User, :count)

      expect(response).to have_http_status :unprocessable_entity
      expect(response).to render_template("users/new")
      
    end
  end

  context '有効な値の場合' do
    let(:user_params) { { user: { name: "Example User",
                                nickname: "Example",
                                email: "user@example.com",
                                password: "password",
                                password_confirmation: "password" } } }
      it '登録されていること' do
        expect {
          post users_path, params: user_params
        }.to change(User, :count).by(1)
      end

      it 'users/show(マイページ)にリダイレクトされること' do
        post users_path, params: user_params
        user = User.last
        expect(response).to redirect_to user
      end

      it 'flashが表示されていること' do
        post users_path, params: user_params
        expect(flash).to be_any
      end

      it 'ログイン状態であること' do
        post users_path, params: user_params
        expect(is_logged_in?).to be_truthy
      end
    end

end
