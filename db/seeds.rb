# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!( name:  "Jun Yamaguchi",
              nickname: "Juny",
              email: "jun_7104@outlook.jp",
              password:              "foobarbaz",
              password_confirmation: "foobarbaz",
              admin: true)

# 追加のユーザーをまとめて生成する
50.times do |n|
name  = Faker::Name.unique.name
nickname = Faker::Name.unique.name
email = "example-#{n+1}@rails.org"
password = "password"
User.create!( name:  name,
              nickname: nickname,
              email: email,
              password:              password,
              password_confirmation: password)
end


# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.beansposts.create!(content: content) }
end


# ユーザーフォローのリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }