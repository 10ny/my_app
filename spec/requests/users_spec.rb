require 'rails_helper'

RSpec.describe "Users", type: :request do
  let (:base_title) {"Serve"}

  describe "#signup" do
    it "HTTPレスポンスを正常に返すこと User Signup" do
      get signup_path
      expect(response).to have_http_status :ok
    end

    it "Sign up | Serve が含まれていること" do
      get signup_path
      expect(response.body).to include "Sign up | #{base_title}"
    end
  end

end
