# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_user, mutation: Mutations::Users::DeleteUser
    field :add_tag, mutation: Mutations::AddTag
    field :add_emotion, mutation: Mutations::AddEmotion
    field :createDream, mutation: Mutations::CreateDream
    field :delete_dream, mutation: Mutations::DeleteDream
    field :delete_dream_tag, mutation: Mutations::DeleteDreamTag
    field :delete_dream_emotion, mutation: Mutations::DeleteDreamEmotion
    field :update_dream, mutation: Mutations::UpdateDream
  end
end
