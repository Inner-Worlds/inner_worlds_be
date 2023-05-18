# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Emotion, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :dream_emotions }
    it { should have_many(:dreams).through(:dream_emotions) }
  end

  describe 'class methods' do
    describe '.default_emotion' do
      it 'return all emotions with a default value of true' do
        e1 = Emotion.create!(name: 'Happy', default: true)
        e2 = Emotion.create!(name: 'Sad', default: true)
        e3 = Emotion.create!(name: 'Horny', default: false)
        e4 = Emotion.create!(name: 'Exuberant', default: true)
        e5 = Emotion.create!(name: 'Dead', default: false)

        expect(Emotion.default_emotion).to eq([e1, e2, e4])
        expect(Emotion.default_emotion).to_not eq([e3, e4])
      end
    end
  end
end
