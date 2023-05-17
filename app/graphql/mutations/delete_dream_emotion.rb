module Mutations
  class DeleteDreamEmotion < Mutations::BaseMutation
    argument :dream_id, ID, required: true
    argument :emotion_id, ID, required: true

    type Types::DreamType

    def resolve(dream_id:, emotion_id:)
      dream_emotion = DreamEmotion.find_by(dream_id: dream_id, emotion_id: emotion_id)
      dream_emotion.destroy!
    end
  end
end