module Types
  class MutationType < Types::BaseObject
    field :delete_dream, mutation: Mutations::DeleteDream
  end
end
