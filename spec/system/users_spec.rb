require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end
  
  describe '#create' do
    context '無効な値の場合' do
      it 'エラーメッセージ用の表示領域が描画されていること' do
        visit signup_path
        fill_in '名前', with: ''
        fill_in 'ニックネーム', with: ''
        fill_in 'メールアドレス', with: 'user@invlid'
        fill_in 'パスワード', with: 'foo'
        fill_in 'パスワード(確認用)', with: 'bar'
        click_button '新規登録'
  
        expect(page).to have_selector 'div#error_explanation'
        expect(page).to have_selector 'div.field_with_errors'
      end
    end
  end

  describe '#index' do
    let!(:admin) { FactoryBot.create(:user) }
    let(:not_admin) { FactoryBot.create(:other) }

    # it 'adminユーザなら削除リンクが表示されていること' do
    #   log_in admin
    #   visit users_path
    #   expect(page).to have_link '削除'
    # end

    it 'adminではないユーザなら削除リンクが表示されていないこと' do
      log_in not_admin
      visit users_path
      expect(page).to_not have_link '削除'
    end
  end
end