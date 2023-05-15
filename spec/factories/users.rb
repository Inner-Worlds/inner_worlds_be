FactoryBot.define do
  factory :user do
    name { Faker::TvShows::VentureBros.character }
    email { Faker::Internet.email }
  end
end
