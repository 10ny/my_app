FactoryBot.define do
  factory :user, class: User do
    name { 'Michael Example' }
    nickname { 'Michael Example' }
    email { 'michael@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :other, class: User do
    name { 'Sterling Archer' }
    nickname { 'Sterling Archer' }
    email { 'duchess@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :another, class: User do
    name { 'Sterling Another' }
    nickname { 'Sterling Another' }
    email { 'another@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :continuous_users, class: User do
    sequence(:name) { |n| "User #{n}" }
    sequence(:nickname) { |n| "Nick #{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Time.zone.now }
  end
end