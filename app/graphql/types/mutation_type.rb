# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_user, mutation: Mutations::Users::DeleteUser
    field :add_tag, mutation: Mutations::AddTag
    field :delete_dream, mutation: Mutations::DeleteDream
    field :delete_dream_tag, mutation: Mutations::DeleteDreamTag
  end
end
