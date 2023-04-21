require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let (:base_title) {"Serve"}

  describe "#root" do
    it "rootにアクセスでhomeを表示すること" do
      get root_url
      expect(response).to have_http_status :ok
    end
  end

  describe "#home" do
    it "HTTPレスポンスを正常に返すこと home" do
      get static_pages_home_path
      expect(response).to have_http_status :ok
    end

    it "ホーム | Serve が含まれていること" do
     get static_pages_home_path
     expect(response.body).to include "ホーム | #{base_title}"
    end
  end

  describe "#about" do
    it "HTTPレスポンスを正常に返すこと about" do
      get static_pages_about_path
      expect(response).to have_http_status :ok
    end

    it "アプリについて | Serve が含まれていること" do
     get static_pages_about_path
     expect(response.body).to include "アプリについて | #{base_title}"
    end
  end

  describe "#contact" do
    it "HTTPレスポンスを正常に返すこと contact" do
      get static_pages_contact_path
      expect(response).to have_http_status :ok
    end

    it "問い合わせ | Serve が含まれていること" do
     get static_pages_contact_path
     expect(response.body).to include "問い合わせ | #{base_title}"
    end
  end

end
