# frozen_string_literal: true

class Dream < ApplicationRecord
  validates_presence_of :description,
                        :title,
                        :dream_date

  validates :lucidity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :dream_emotions, dependent: :destroy
  has_many :emotions, through: :dream_emotions
  has_many :dream_tags, dependent: :destroy
  has_many :tags, through: :dream_tags
end
