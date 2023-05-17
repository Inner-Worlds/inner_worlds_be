# frozen_string_literal: true

FactoryBot.define do
  factory :emotion do
    name { Faker::Movies::PrincessBride.quote }
  end
end
