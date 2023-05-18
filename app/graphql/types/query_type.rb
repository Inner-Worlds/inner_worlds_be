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
    
    field :default_emotions, [Types::EmotionType], null: false

    def default_emotions
      Emotion.default_emotion
    end

    field :default_tags, [Types::TagType], null: false

    def default_tags
      Tag.default_tags
    end
  end
end
