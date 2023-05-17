# frozen_string_literal: true

class Emotion < ApplicationRecord
  validates_presence_of :name

  has_many :dream_emotions
  has_many :dreams, through: :dream_emotions

  def self.default_emotion
    Emotion.where(default: true)
  end
end
