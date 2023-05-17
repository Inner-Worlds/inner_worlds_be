# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :dream_tags }
    it { should have_many(:dreams).through(:dream_tags) }
  end

  describe 'class methods' do
    describe '.default_tags' do
      it 'returns an array of default tags' do
        happy = Tag.create(name: 'happy', default: true)
        sad = Tag.create(name: 'sad', default: true)
        angry = Tag.create(name: 'angry', default: true)

        melancholy = Tag.create(name: 'melancholy')
        somber = Tag.create(name: 'somber')

        expect(Tag.default_tags).to eq([happy, sad, angry])
        expect(Tag.default_tags).to_not include(melancholy, somber)
      end
    end
  end
end
