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



  describe 'POST /users #create' do
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



  describe 'GET users/{id}/edit' do
    let(:user) { FactoryBot.create(:user) }
    
    it 'HTTPレスポンスを正常に返すこと User edit' do
      log_in user
      get edit_user_path(user)
      expect(response).to have_http_status :ok
    end

    it 'アカウント編集 | Serve が含まれていること' do
      log_in user
      get edit_user_path(user)
      expect(response.body).to include "アカウント編集 | #{base_title}"
    end

    context '未ログインの場合' do
      it 'flashが空ではないこと' do
        get edit_user_path(user)
        expect(flash).to_not be_empty
      end

      it '未ログインユーザはログインページにリダイレクトされること' do
        get edit_user_path(user)
        expect(response).to redirect_to login_path
      end

      it 'ログイン後アカウント編集ページにリダイレクトされること' do
        get edit_user_path(user)
        log_in user
        expect(response).to redirect_to edit_user_path(user)
      end
    end

    context '別ユーザの場合' do
      let(:other_user) { FactoryBot.create(:other) }

      it 'flashが空であること' do
        log_in other_user
        get user_path(other_user) # 一度ユーザページへ遷移してからアカウント編集へ
        get edit_user_path(user)
        expect(flash).to be_empty
      end

      it 'ルートパスにリダイレクトされること' do
        log_in other_user
        get user_path(other_user) # 一度ユーザページへ遷移してからアカウント編集へ
        get edit_user_path(user)
        expect(response).to redirect_to root_path
      end
    end

  end



  describe 'PATCH /users' do
    let(:user) { FactoryBot.create(:user) }

    context '未ログインの場合' do
      it 'flashが空ではないこと' do
        patch user_path(user), params:  { user: { name: user.name,
                                                  email: user.email } }
        expect(flash).to_not be_empty
      end

      it '未ログインユーザはログインページにリダイレクトされること' do
        patch user_path(user), params:  { user: { name: user.name,
                                                  email: user.email } }
        expect(response).to redirect_to login_path
      end
    end

    context '無効な値の場合' do
      before do
        log_in user
        patch user_path(user), params: { user: { name: '',
                                                  email: 'foo@invlid',
                                                  password: 'foo',
                                                  password_confirmation: 'bar' } }
        end

      it '更新できないこと' do
        user.reload
        expect(user.name).to_not eq ''
        expect(user.nickname).to_not eq ''
        expect(user.email).to_not eq 'foo@invlid'
        expect(user.password).to_not eq 'foo'
        expect(user.password_confirmation).to_not eq 'bar'
      end

      it '更新アクション後にeditビューが表示されること' do
        expect(response.body).to include "アカウント編集 | #{base_title}"
      end
    end

    context '有効な値の場合' do
      before do
        @name = 'Foo Bar'
        @nickname = 'FooBarBaz'
        @email = 'foo@bar.com'
        log_in user
        patch user_path(user), params:  { user: { name: @name,
                                                  nickname: @nickname,
                                                  email: @email,
                                                  password: '',
                                                  password_confirmation: '' } }
      end

      it '更新できること' do
        user.reload
        expect(user.name).to eq @name
        expect(user.nickname).to eq @nickname
        expect(user.email).to eq @email
      end
    
      context '別ユーザの場合' do
        let(:other_user) { FactoryBot.create(:other) }

        before do
          log_in other_user
          get user_path(other_user) # 一度ユーザページへ遷移してからアカウント編集へ
          patch user_path(user), params:  { user: { name: user.name,
                                                    email: user.email } }
        end
  
        it 'flashが空であること' do
          expect(flash).to be_empty
        end
  
        it 'ルートパスにリダイレクトされること' do
          expect(response).to redirect_to root_path
        end
      end

    end
  end
  
end
