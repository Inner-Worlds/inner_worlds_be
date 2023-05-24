# frozen_string_literal: true

module Mutations
  class CreateDream < Mutations::BaseMutation
    argument :user_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :emotions, [String], required: false
    argument :tags, [String], required: false
    argument :lucidity_level, Int, required: false
    argument :dream_date, String, required: true

    type Types::DreamType

    def resolve(user_id:, title:, description:, dream_date:, emotions: [], tags: [], lucidity_level: nil, **_args)
      user = User.find_by_id(user_id)
      raise GraphQL::ExecutionError, 'User not found' unless user

      dream = Dream.create!(
        user_id:,
        description:,
        lucidity: lucidity_level,
        title:,
        dream_date: Date.parse(dream_date)
      )

      emotions.map do |name|
        new_emotion = Emotion.find_or_create_by(name:)
        DreamEmotion.create!(dream_id: dream.id, emotion_id: new_emotion.id)
      end

      TagFacade.new(dream, tags).generate_tags

      dream
    end
  end
end
