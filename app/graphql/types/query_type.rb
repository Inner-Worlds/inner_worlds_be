module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    
    field :user, Types::UserType, null: false do 
      argument :id, ID, required: true
    end
  
    def user(id:)
      user = User.find_by(id: id)
      if user
        user
      else
        raise GraphQL::ExecutionError, "User not found"
      end
    end

    field :all_emotions, Types::EmotionType, null: false

    def all_emotions
      Emotion.all
    end
  end
end
