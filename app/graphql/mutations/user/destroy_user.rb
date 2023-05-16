module Mutations
  module Users
    class DestroyUser < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::UserType

      def resolve(id:)
        User.find(id).destroy
      end
    end
  end
end