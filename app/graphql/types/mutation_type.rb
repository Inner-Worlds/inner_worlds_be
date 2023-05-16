module Types
  class MutationType < Types::BaseObject
    field :destroy_user, mutation: Mutations::Users::DestroyUser
  end
end
