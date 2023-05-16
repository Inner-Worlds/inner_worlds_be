module Types
  class MutationType < Types::BaseObject
    field :destroy_user, mutation: Mutations::Users::DestroyUser
    field :delete_dream, mutation: Mutations::DeleteDream
  end
end
