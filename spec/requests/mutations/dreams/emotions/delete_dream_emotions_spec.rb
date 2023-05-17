require "rails_helper"

RSpec.describe DreamEmotion, type: :request do 
  describe "Delete dream emotion" do 
   describe "when successful" do 
      it "deletes a dream emotion" do 
        user = create(:user)
        dream = create(:dream, user:)
        emotion = create(:emotion)
        dream_emotion = create(:dream_emotion, emotion:, dream:)

        expect(DreamEmotion.count).to eq(1)

        post "/graphql", params: { query: mutation(dream.id, emotion.id)}

        json_response = JSON.parse(response.body, symbolize_names: true)

        deleted_dream_emotion = json_response[:data][:deleteDreamEmotion]
        
        expect(DreamEmotion.count).to eq(0)
        expect(deleted_dream_emotion.keys).to eq([:id])
        expect(deleted_dream_emotion[:id].to_i).to eq(emotion.id)
      end
    end
  end

  def mutation(dream_id, emotion_id)
    <<~GQL
    mutation{
      deleteDreamEmotion(input: {dreamId: #{dream_id}, emotionId: #{emotion_id}})
      {
        id
      }
    }
    GQL
  end
end