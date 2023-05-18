require "rails_helper"

RSpec.describe Dream, type: :request do 
  describe "Update a dream" do 
    it "can update a dream" do 
      user = create(:user)
      dream = create(:dream, user:)
      new_title = "Help! I've fallen and I can't get up!"
      new_description = "Clap on! Clap off!"

      post "/graphql", params: { query: dream_mutation(id: dream.id, title: new_title, description: new_description) }

      update_response = JSON.parse(response.body, symbolize_names: true)
      updated_dream = update_response[:data][:updateDream]

      expect(updated_dream[:title]).to_not eq(dream.title)
      expect(updated_dream[:title]).to eq("Help! I've fallen and I can't get up!")

      expect(updated_dream[:description]).to_not eq(dream.description)
      expect(updated_dream[:description]).to eq("Clap on! Clap off!")
    end
  end

  def dream_mutation(id: , title: , description:)
    <<~GQL
    mutation{
      updateDream(input: {id: "#{id}", title: "#{title}", description: "#{description}"})
      {
      id
      title
      description
      }
    }
    GQL
  end
end