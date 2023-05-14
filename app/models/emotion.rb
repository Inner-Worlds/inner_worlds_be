class Emotion < ApplicationRecord
  has_many :dream_emotions
  has_many :dreams, through: :dream_emotions
end
