require 'rails_helper'

RSpec.describe DreamTag, type: :model do
  describe "validations" do 

  end
  
  describe "relationships" do 
    it { should belong_to :dream }
    it { should belong_to :tag }
  end
end
