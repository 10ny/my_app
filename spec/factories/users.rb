FactoryBot.define do
  factory :user, class: User do
    name { 'Michael Example' }
    nickname { 'Michael Example' }
    email { 'michael@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :other, class: User do
    name { 'Sterling Archer' }
    nickname { 'Sterling Archer' }
    email { 'duchess@example.gov' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end