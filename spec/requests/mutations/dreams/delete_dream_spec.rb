require "rails_helper"

RSpec.describe Dream, type: :request do 
  describe "Get one user" do 
    it "can delete a dream" do 
      user = create(:user)
      dream = create(:dream, user: user)
      emotion = create(:emotion)
      dream_emotion = create(:dream_emotion, emotion: emotion, dream: dream)
      tag = create(:tag)
      dream_tag = create(:dream_tag, tag: tag, dream: dream)

      expect(Dream.count).to eq(1)

      post "/graphql", params: { query: mutation(dream.id)}

      user_response = JSON.parse(response.body, symbolize_names: true)
      deleted_data = user_response[:data][:deleteDream]

      expect(Dream.count).to eq(0)
      expect(deleted_data.keys).to eq([:id, :title])
      expect(deleted_data[:id].to_i).to eq(dream.id)
      expect(deleted_data[:title]).to eq(dream.title)
    end
  end

  def mutation(dream_id)
    <<~GQL
      mutation{
        deleteDream(input: {id: #{dream_id}}){
          id
          title
        }
      }
    GQL
  end
end