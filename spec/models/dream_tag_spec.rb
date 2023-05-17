# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DreamTag, type: :model do
  describe 'validations' do
    it { should validate_presence_of :dream_id }
    it { should validate_presence_of :tag_id }
  end

  describe 'relationships' do
    it { should belong_to :dream }
    it { should belong_to :tag }
  end
end
