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
end
