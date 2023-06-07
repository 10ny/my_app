source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails",           "7.0.4"
gem "kaminari"                    #ページネーション用gem
gem "i18n",            "~> 1.13"  # 日本語化gem
gem "rails-i18n",      "7.0.6"    # 日本語化gem
gem "dotenv-rails",    "~> 2.8"   # 環境変数用gem
gem "carrierwave",     "~> 2.2"   # 画像アップロード用gem
gem "image_processing",           "1.12.2" # 画像分析・加工用gem
gem "active_storage_validations", "0.9.8" # 画像のバリデーション追加用gem
gem "bcrypt",          "3.1.18"   # ハッシュ化gem
gem 'bootstrap',       '~> 5.3.0.alpha3'
gem 'jquery-rails'
gem "sassc-rails",     "2.1.2"
gem "sprockets-rails", "3.4.2"
gem "importmap-rails", "1.1.0"
gem "turbo-rails",     "1.1.1"
gem "stimulus-rails",  "1.0.4"
gem "jbuilder",        "2.11.5"
gem "puma",            "5.6.4"
gem "bootsnap",        "1.12.0", require: false

group :development, :test do
  gem "sqlite3", "1.4.2"
  gem "debug",   "1.5.0", platforms: %i[ mri mingw x64_mingw ]
  gem "faker",           "2.21.0" # 開発環境のみユーザデータサンプル作成
end

group :development do
  gem "web-console", "4.2.0"
end

group :test do
  gem "capybara",                 "3.37.1"
  gem "selenium-webdriver",       "4.2.0"
  gem "webdrivers",               "5.0.0"
  gem "rails-controller-testing", "1.0.5"
  gem "minitest",                 "5.15.0"
  gem "minitest-reporters",       "1.5.0"
  gem "guard",                    "2.18.0"
  gem 'guard-rspec',              require: false
  gem "guard-minitest",           "2.4.6"
  gem 'rspec-rails',              "6.0.0"
  gem 'factory_bot_rails',         "6.2.0"
end

group :production do
  gem "pg",         "1.3.5"
  gem "aws-sdk-s3", "1.114.0", require: false
end