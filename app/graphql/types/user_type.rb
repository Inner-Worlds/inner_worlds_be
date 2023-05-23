# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :dreams, [Types::DreamType], null: true
    field :stats, Types::StatType, null: false

    def dreams
      object.sorted_dreams_date_asc
    end

    def stats
            # StatSenderWorker.perform_async(object.id)
      {
        current_streak: object.current_streak,
        longest_streak: object.longest_streak,
        dreams_this_month: object.dreams_this_month,
        dreams_this_week: object.dreams_this_week,
        total_dreams: object.total_dreams,
        average_lucidity: object.average_lucidity,
        top_5_emotions: object.top_5_emotions,
        top_5_tags: object.top_5_tags
      }
    end
  end
end

# StatSenderJob.perform_async(object.id)