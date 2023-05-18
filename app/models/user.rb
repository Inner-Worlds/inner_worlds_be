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


  #ALL OF THE BELOW ARE TODO:
  def current_streak
    7
  end

  def longest_streak
    12
  end

  def dreams_this_month 
    20
  end

  def dreams_this_week
    5
  end

  def total_dreams
    100
  end

  def average_lucidity
    2.5
  end

  def top_5_emotions
    [{name: "Angry", frequency: 12, percent: 20.1}, {name: "Happy", frequency: 12, percent: 20.1}, {name: "Joyful", frequency: 12, percent: 20.1}, {name: "Anxious", frequency: 12, percent: 20.1}, {name: "Weird", frequency: 12, percent: 20.1}]
  end

  def top_5_tags 
    [{name: "Angry", frequency: 12, percent: 20.1}, {name: "Happy", frequency: 12, percent: 20.1}, {name: "Joyful", frequency: 12, percent: 20.1}, {name: "Anxious", frequency: 12, percent: 20.1}, {name: "Weird", frequency: 12, percent: 20.1}]
  end

end
