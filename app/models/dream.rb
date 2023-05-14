class Dream < ApplicationRecord
  belongs_to :user
  has_many :dream_emotions
  has_many :emotions, through: :dream_emotions
  has_many :dream_tags
  has_many :tags, through: :dream_tags
end
