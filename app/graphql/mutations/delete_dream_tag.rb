# frozen_string_literal: true

module Mutations
  class DeleteDreamTag < Mutations::BaseMutation
    argument :dream_id, ID, required: true
    argument :tag_id, ID, required: true

    type Types::DreamType

    def resolve(dream_id:, tag_id:)
      dream_tag = DreamTag.find_by(dream_id:, tag_id:)
      dream_tag.destroy!
    end
  end
end
