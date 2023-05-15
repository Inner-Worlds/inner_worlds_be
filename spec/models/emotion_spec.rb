require 'rails_helper'

RSpec.describe Emotion, type: :model do
  describe "validations" do 
    it { should validate_presence_of :name }
  end
  describe "relationships" do 
    it { should have_many :dream_emotions }
    it { should have_many(:dreams).through(:dream_emotions) }
  end
end
