class User < ApplicationRecord
  has_many :dreams
  has_many :dream_emotions, through: :dreams
  has_many :dream_tags, through: :dreams
  has_many :emotions, through: :dream_emotions
  has_many :tags, through: :dream_tags
end
