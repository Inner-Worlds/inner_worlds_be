module Types
  class MutationType < Types::BaseObject
    field :delete_user, mutation: Mutations::Users::DeleteUser
    field :add_tag, mutation: Mutations::AddTag
    field :delete_dream, mutation: Mutations::DeleteDream
  end
end
