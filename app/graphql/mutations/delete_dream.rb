# frozen_string_literal: true

module Mutations
  class DeleteDream < Mutations::BaseMutation
    # arguments passed to the `resolved` method
    argument :id, ID, required: true

    # return type from the mutation
    type Types::DreamType

    def resolve(id:)
      Dream.find(id).destroy!
    end
  end
end
