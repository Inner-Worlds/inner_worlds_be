require "rails_helper"

RSpec.describe DreamTag, type: :request do 
  describe "Delete dream tag" do 
   describe "when successful" do 
    it "deletes a dream tag" do 
      user = create(:user)
      dream = create(:dream, user:)
      tag = create(:tag)
      dream_tag = create(:dream_tag, tag:, dream:)

      expect(DreamTag.count).to eq(1)

      post "/graphql", params: { query: mutation(dream.id, tag.id)}

      json_response = JSON.parse(response.body, symbolize_names: true)

      deleted_dream_tag = json_response[:data][:deleteDreamTag]

      expect(DreamTag.count).to eq(0)
      expect(deleted_dream_tag.keys).to eq([:id])
      expect(deleted_dream_tag[:id].to_i).to eq(dream_tag.id)
    end
   end
  end

    def mutation(dream_id, tag_id)
    <<~GQL
    mutation{
      deleteDreamTag(input: {dreamId: #{dream_id}, tagId: #{tag_id}})
      {
        id
      }
    }
    GQL
  end
end
