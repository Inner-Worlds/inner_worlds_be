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

  def current_streak
    streak_date = Date.today
    streak_length = 0
  
    while dreams.where(dream_date: streak_date).exists?
      streak_length += 1
      streak_date -= 1.day
    end
  
    streak_length
  end

  def longest_streak
    sorted_dates = dreams.order(:dream_date).pluck(:dream_date).map(&:to_date)
    streaks = sorted_dates.chunk_while { |date1, date2| date1.next_day == date2 }.to_a
    longest_streak = streaks.max_by(&:length).size
  end

  def dreams_this_month
    current_date = Date.today
    start_date = current_date.beginning_of_month
    end_date = current_date.end_of_month
    dreams.where(dream_date: start_date..end_date).count
  end

  def dreams_this_week
    week_start_date = Date.today.beginning_of_week(:sunday)  # Adjust the start of the week based on your desired configuration
    week_end_date = week_start_date + 6
    dreams.where(dream_date: week_start_date..week_end_date).count
  end

  def total_dreams
    dreams.count
  end

  def average_lucidity
    week_start_date = Date.today.beginning_of_week(:sunday)
    week_end_date = week_start_date + 6
    dream_days = dreams.where(dream_date: week_start_date..week_end_date)
    total_dreams_this_week = dreams_this_week
    sum_lucidity_this_week = dream_days.sum(:lucidity)
   
    if total_dreams_this_week > 0
      average = sum_lucidity_this_week.to_f / total_dreams_this_week
    else
      average = 0.0
    end
  
    average.round(2)
  end

  def top_5_emotions
    top_emotions = emotions.select("emotions.name, emotions.id, count(emotions.name) as frequency").group(:id).order("frequency desc", "emotions.name").limit(5)

    top_5 = top_emotions.map do |emotion|
      { name: emotion.name, frequency: emotion.frequency, percent: (emotion.frequency.to_f/ dreams.count.to_f * 100).round(2) }
    end
  end

  def top_5_tags
    top_tags = tags.select("tags.name, tags.id, count(tags.name) as frequency").group(:id).order("frequency desc", "tags.name").limit(5)

    top_5 = top_tags.map do |tag|
      { name: tag.name, frequency: tag.frequency, percent: (tag.frequency.to_f / dreams.count.to_f * 100).round(2) }
    end
  end
end
