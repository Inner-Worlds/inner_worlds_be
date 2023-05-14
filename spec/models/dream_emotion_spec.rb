require 'rails_helper'

RSpec.describe DreamEmotion, type: :model do
  describe "relationships" do 
    it { should belong_to :emotion }
    it { should belong_to :dream }
  end
end
