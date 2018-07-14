FactoryBot.define do
  factory :user do
    username {Faker::HeyArnold.character}
    password '123456'
  end
end
