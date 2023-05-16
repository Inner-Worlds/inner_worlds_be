module Types
  class MutationType < Types::BaseObject
    field :add_tag, mutation: Mutations::AddTag
  end
end
