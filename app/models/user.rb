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
  #I have filled them with the correct data types
  #to test whether the path works
  #and to give you a template
  #delete this message when the below is complete
  #--Weston
  
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
    top_tags = tags.select("tags.name, tags.id, count(tags.name) as frequency").group(:id).order("frequency desc", "tags.name").limit(5)

    top_5 = top_tags.map do |tag|
      {name: tag.name, frequency: tag.frequency, percent: (tag.frequency.to_f / dreams.count.to_f * 100).round(2)}
    end
  end
end
