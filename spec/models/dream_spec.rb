# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dream, type: :model do
  describe 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :title }
    it { should validate_presence_of :dream_date }
    it { should validate_numericality_of :lucidity }
    it { should_not allow_value(-1).for(:lucidity) }
    it { should allow_value(0).for(:lucidity) }
  end
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :dream_emotions }
    it { should have_many(:emotions).through(:dream_emotions) }
    it { should have_many :dream_tags }
    it { should have_many(:tags).through(:dream_tags) }
  end
end
