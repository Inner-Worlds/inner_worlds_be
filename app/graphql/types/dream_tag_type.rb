# frozen_string_literal: true

module Types
  class DreamTagType < Types::BaseObject
    field :id, ID, null: false
    field :dream, Types::DreamType, null: false
    field :tag, Types::TagType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
