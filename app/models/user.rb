# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name,
                        :email
  has_many :dreams, dependent: :destroy
  has_many :dream_emotions, through: :dreams
  has_many :dream_tags, through: :dreams
  has_many :emotions, through: :dream_emotions
  has_many :tags, through: :dream_tags


  def sorted_dreams_date_asc
    dreams.order(:dream_date)
  end
end
