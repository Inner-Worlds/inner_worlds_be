FactoryBot.define do
  factory :tag do
    name { Faker::Music::Phish.song }
  end
end
