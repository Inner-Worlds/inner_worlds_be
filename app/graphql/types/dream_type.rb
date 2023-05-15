# frozen_string_literal: true

module Types
  class DreamType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :description, String
    field :lucidity, Integer
    field :title, String
    field :dream_date, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
