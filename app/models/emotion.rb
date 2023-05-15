class Emotion < ApplicationRecord
  validates_presence_of :name

  has_many :dream_emotions
  has_many :dreams, through: :dream_emotions
end
