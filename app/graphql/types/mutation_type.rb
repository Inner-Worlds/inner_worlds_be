module Types
  class MutationType < Types::BaseObject
    field :delete_user, mutation: Mutations::Users::DeleteUser
    field :add_tag, mutation: Mutations::AddTag
    field :add_emotion, mutation: Mutations::AddEmotion
    field :createDream, mutation: Mutations::CreateDream
    field :deleteDream, mutation: Mutations::DeleteDream
  end
end
