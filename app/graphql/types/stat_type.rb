# frozen_string_literal: true

module Types
  class StatType < Types::BaseObject
    field :dream_num_month, Integer, null: false
    field :dream_num_week, Integer, null: false
    field :total_dreams, Integer, null: false
    field :average_lucidity, Float, null: false
    field :top_5_emotions, [Types::EmotionStatType], null: false
    field :top_5_tags, [Types::TagStatType], null: false
    field :current_streak, Integer, null: false
    field :longest_streak, Integer, null: false

    def dream_num_month
      object[:dreams_this_month]
    end
    
    def dream_num_week
      object[:dreams_this_week]
    end
    
    def total_dreams
      object[:total_dreams]
    end
    
    def average_lucidity
      object[:average_lucidity]
    end
    
    def current_streak
      object[:current_streak]
    end
    
    def longest_streak
      object[:longest_streak]
    end

    def top_5_emotions
      object[:top_5_emotions]
    end

    def top_5_tags
      object[:top_5_tags]
    end
  end
end