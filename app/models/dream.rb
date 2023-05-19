# frozen_string_literal: true

class Dream < ApplicationRecord
  validates_presence_of :description,
                        :title,
                        :dream_date

  # validates :dream_date, format: /\d{2}\/\d{2}\/\d{4}/
  before_save :ensure_datetime_object
  validates :lucidity, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :dream_emotions, dependent: :destroy
  has_many :emotions, through: :dream_emotions
  has_many :dream_tags, dependent: :destroy
  has_many :tags, through: :dream_tags

  private 
  def ensure_datetime_object
    require 'pry'; binding.pry
    if self.dream_date.class == String
      DateTime.strptime(self.dream_date, '%m/%d/%Y')
    end
  end
end
