require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let (:base_title) {"Serve"}

  describe "#root" do
    it "rootにアクセスでhomeを表示すること" do
      get root_path
      expect(response).to have_http_status :ok
    end
  end

  describe "#home" do
    it "HTTPレスポンスを正常に返すこと home" do
      get root_path
      expect(response).to have_http_status :ok
    end

    it "Serve が含まれていること" do
      get root_path
      expect(response.body).to include "<title>#{base_title}</title>"
    end
  end

  describe "#about" do
    it "HTTPレスポンスを正常に返すこと about" do
      get about_path
      expect(response).to have_http_status :ok
    end

    it "Serveについて | Serve が含まれていること" do
      get about_path
      expect(response.body).to include "Serveについて | #{base_title}"
    end
  end

  describe "#contact" do
    it "HTTPレスポンスを正常に返すこと contact" do
      get contact_path
      expect(response).to have_http_status :ok
    end

    it "問い合わせ | Serve が含まれていること" do
      get contact_path
      expect(response.body).to include "問い合わせ | #{base_title}"
    end
  end

end
