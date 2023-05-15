class DreamEmotion < ApplicationRecord 
  validates_presence_of :dream_id,
                       :emotion_id
  belongs_to :emotion
  belongs_to :dream
end
