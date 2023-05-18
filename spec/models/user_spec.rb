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


  describe '#sorted_dreams_date_asc' do
    it 'should return an array of dreams in order by date from oldest to newest' do
      user = create(:user)
      dream1 = create(:dream, dream_date: DateTime.new(2023), user: user)
      dream2 = create(:dream, dream_date: DateTime.new(1999), user: user)
      dream3 = create(:dream, dream_date: DateTime.new(2001), user: user)
      dream4 = create(:dream, dream_date: DateTime.new(2003), user: user)
      dream5 = create(:dream, dream_date: DateTime.new(2024), user: user)
      expect(user.sorted_dreams_date_asc).to eq([dream2, dream3, dream4, dream1, dream5])
    end
  end
end
