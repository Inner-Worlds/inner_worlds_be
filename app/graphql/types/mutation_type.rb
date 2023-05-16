module Types
  class MutationType < Types::BaseObject
    field :add_tag, mutation: Mutations::AddTag
    field :delete_dream, mutation: Mutations::DeleteDream
  end
end
