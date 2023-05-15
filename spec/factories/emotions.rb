FactoryBot.define do
  factory :emotion do
    name { Faker::Movies::PrincessBride.quote }
  end
end
