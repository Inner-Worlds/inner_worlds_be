# frozen_string_literal: true

module Mutations
  module Users
    class DeleteUser < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::UserType

      def resolve(id:)
        User.find(id).destroy!
      end
    end
  end
end
