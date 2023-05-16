require 'rails_helper'

RSpec.describe Dream, type: :request do
  describe "Get one user" do 
    it "can create a dream" do 
      user = create(:user)
      dream = create(:dream, user: user)
      emotion = create(:emotion)
      dream_emotion = create(:dream_emotion, emotion: emotion, dream: dream)
      tag = create(:tag)
      dream_tag = create(:dream_tag, tag: tag, dream: dream)
      
      expect(Dream.count).to eq(1)
      
      post "/graphql", params: { query: mutation(dream.id)}
      
      user_response = JSON.parse(response.body, symbolize_names: true)
      binding.pry

      expect(Dream.count).to eq(1)
    end
  end

  def mutation(dream_id)
    <<~GQL
      mutation{
        createDream(input: {id: #{dream_id}}){
          id
          title
        }
      }
    GQL
  end
end