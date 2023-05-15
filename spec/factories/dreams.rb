FactoryBot.define do
  factory :dream do
    user { Faker::Number.within(range: 0..5) }
    description { Faker::Movies::Ghostbusters.quote }
    lucidity { Faker::Number.within(range: 1..5) }
    title { Faker::Movies::PrincessBride.character }
    dream_date { Faker::Date.in_date_period }
  end
end
