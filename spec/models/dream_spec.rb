require 'rails_helper'

RSpec.describe Dream, type: :model do
  describe "relationships" do 
    it { should belong_to :user }
    it { should have_many :dream_emotions }
    it { should have_many(:emotions).through(:dream_emotions) }
    it { should have_many :dream_tags }
    it { should have_many(:tags).through(:dream_tags) }
  end
end
