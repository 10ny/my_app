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
end
