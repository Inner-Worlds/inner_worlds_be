# frozen_string_literal: true

FactoryBot.define do
  factory :dream_tag do
    association :tag, :dream
  end
end
