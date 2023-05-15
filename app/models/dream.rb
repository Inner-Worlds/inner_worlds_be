class Dream < ApplicationRecord
  validates_presence_of :description,
                        :title,
                        :dream_date

  # validates :dream_date, format: /\d{2}\/\d{2}\/\d{4}/

  validates :lucidity, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :dream_emotions
  has_many :emotions, through: :dream_emotions
  has_many :dream_tags
  has_many :tags, through: :dream_tags
end
