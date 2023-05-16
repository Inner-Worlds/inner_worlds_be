# frozen_string_literal: true

FactoryBot.define do
  factory :dream_emotion do
    association :emotion, :dream
  end
end
