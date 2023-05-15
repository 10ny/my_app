FactoryBot.define do
  factory :orange, class: Beanspost do
    content { 'I just ate an orange!' }
    created_at { 10.minutes.ago }
  end

  factory :most_recent, class: Beanspost do
    content { 'Writing a short test' }
    created_at { Time.zone.now }
    user { association :user, nickname: 'Example', email: 'recent@example.com' }
  end
end

def user_with_posts(posts_count: 5)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:orange, posts_count, user: user)
  end
end