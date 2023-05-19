# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :dreams }
    it { should have_many(:dream_emotions).through(:dreams) }
    it { should have_many(:dream_tags).through(:dreams) }
    it { should have_many(:emotions).through(:dream_emotions) }
    it { should have_many(:tags).through(:dream_tags) }
  end

  let (:user) { create(:user) }

  describe '#sorted_dreams_date_asc' do
    it 'should return an array of dreams in order by date from oldest to newest' do
      dream1 = create(:dream, dream_date: DateTime.new(2023), user: user)
      dream2 = create(:dream, dream_date: DateTime.new(1999), user: user)
      dream3 = create(:dream, dream_date: DateTime.new(2001), user: user)
      dream4 = create(:dream, dream_date: DateTime.new(2003), user: user)
      dream5 = create(:dream, dream_date: DateTime.new(2024), user: user)
      expect(user.sorted_dreams_date_asc).to eq([dream2, dream3, dream4, dream1, dream5])
    end
  end

  describe '#current_streak' do
    xit 'should return the current streak for a user recording dreams' do
      expect(user.current_streak).to be_an(Integer)
    end
  end

  describe '#longest_streak' do
    xit 'should return the longest streak for a user recording dream' do
      expect(user.longest_streak).to be_an(Integer)
    end
  end

  describe '#dreams_this_month' do
    xit 'should return the total dreams that a user has recorded in the CALENDAR month' do #i.e. not the past 30 days, but since the first of the month
      expect(user.dreams_this_month).to be_an(Integer)
    end
  end

  describe '#dreams_this_week' do
    xit 'should return the number of dreams the user has had this CALENDAR week' do #Sunday to Saturday, i.e. not just the past 7 days
      expect(user.dreams_this_week).to be_an(Integer)
    end
  end

  describe '#total_dreams' do
    xit 'should return the total dreams recorded by a user' do
      expect(user.total_dreams).to be_an(Integer)
    end
  end

  describe '#average_lucidity' do
    xit 'should return average lucidity across all recorded dreams' do
      expect(user.average_lucidity).to be_a(Float) #Float should probably terminate at 1 or 2 decimal places
    end
  end

  describe '#top_5_emotions' do
    xit 'should return an array of hashes of the top 5 emotion names with frequency and percent of whole' do
      expect(user.top_5_emotions).to be_an(Array)
      expect(user.top_5_emotions.sample).to be_a(Hash)
      expect(user.top_5_emotions.sample.keys).to contain_exactly(:name, :frequency, :percent)
      expect(user.top_5_emotions.size).to eq(5)
      
    end
  end

  describe '#top_5_tags' do
    xit 'should return a hash of hashes of the top 5 tag names with frequency and percent of whole' do
      expect(user.top_5_tags).to be_an(Array)
      expect(user.top_5_emotions.sample).to be_a(Hash)
      expect(user.top_5_emotions.sample.keys).to contain_exactly(:name, :frequency, :percent)
      expect(user.top_5_emotions.size).to eq(5)
    end
  end
end
