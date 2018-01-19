
FactoryBot.define do
  sequence(:uid, 2222) do |x|
    "uid#{ x.to_s }"
  end

  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    uid { }
  end
end
