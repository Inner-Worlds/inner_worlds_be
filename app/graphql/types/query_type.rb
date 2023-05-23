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

    # field:user_stats, Types::UserType, null: true do
    #   argument :user_id, ID, required: true
    # end

    # def user_stats(user_id:)
    #   user = User.find_by(id: user_id)
    #   return unless user

      # {
      #   user_id: user.id,
      #   name: user.name,
      #   email: user.email,
      #   stats: user.stats
      # }
    # end
  end
end
