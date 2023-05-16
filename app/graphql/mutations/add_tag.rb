# frozen_string_literal: true

module Mutations
  class AddTag < Mutations::BaseMutation
    argument :dream_id, ID
    argument :name, String

    field :tag, Types::TagType
    field :dreamTag, Types::DreamTagType
    field :errors, [String], null: false

    def resolve(name:, dream_id:)
      dream = Dream.find_by_id(dream_id)

      return error_response('Dream not found') unless dream

      tag = Tag.find_or_initialize_by(name:)
      return error_response(tag.errors.full_messages) if tag.new_record? && !tag.save

      dream_tag = DreamTag.find_or_create_by(dream_id: dream.id, tag_id: tag.id)

      {
        dreamTag: dream_tag,
        tag:,
        errors: []
      }
    end

    private

    def error_response(message)
      { dreamTag: nil, tag: nil, errors: [message] }
    end
  end
end
