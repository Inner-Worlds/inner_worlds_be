# frozen_string_literal: true

module Mutations
  class AddEmotion < Mutations::BaseMutation
    argument :dream_id, ID
    argument :name, String

    field :emotion, Types::EmotionType
    field :dreamEmotion, Types::DreamEmotionType
    field :errors, [String], null: false

    def resolve(name:, dream_id:)
      dream = Dream.find_by_id(dream_id)

      return error_response('Dream not found') unless dream

      emotion = Emotion.find_or_initialize_by(name:)
      return error_response(emotion.errors.full_messages) if emotion.new_record? && !emotion.save

      dream_emotion = DreamEmotion.find_or_create_by(dream_id: dream.id, emotion_id: emotion.id)

      {
        dreamEmotion: dream_emotion,
        emotion:,
        errors: []
      }
    end

    private

    def error_response(message)
      { dreamEmotion: nil, tag: nil, errors: [message] }
    end
  end
end
