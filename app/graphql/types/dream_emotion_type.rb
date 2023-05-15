# frozen_string_literal: true

module Types
  class DreamEmotionType < Types::BaseObject
    field :id, ID, null: false
    field :emotion_id, Integer, null: false
    field :dream_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
