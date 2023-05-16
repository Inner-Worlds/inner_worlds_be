# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DreamEmotion, type: :model do
  describe 'validations' do
    it { should validate_presence_of :dream_id }
    it { should validate_presence_of :emotion_id }
  end

  describe 'relationships' do
    it { should belong_to :emotion }
    it { should belong_to :dream }
  end
end
