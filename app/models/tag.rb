class Tag < ApplicationRecord
  has_many :dream_tags
  has_many :dreams, through: :dream_tags
end
