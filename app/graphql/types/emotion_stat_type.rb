module Types
  class EmotionStatType < Types::BaseObject
    field :name, String, null: false
    field :frequency, Integer, null: false
    field :percent, Float, null: false

    def name
      object[:name]
    end

    def frequency
      object[:frequency]
    end

    def percent
      object[:percent]
    end
  end
end