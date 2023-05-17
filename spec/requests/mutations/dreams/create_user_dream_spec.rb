require 'rails_helper'

RSpec.describe Dream, type: :request do
  describe '.resolve' do
    it "creates a dream" do 
      user = create(:user)

      expect do
        post '/graphql', params: { query: mutation(user) }
        json = JSON.parse(response.body)
   
        binding.pry
      end.to change { Dream.count }.by(1)

    end
      
    xit "returns a dream" do
      user = create(:user)
      dream = create(:dream, user: user)
      emotion = create(:emotion)
      dream_emotion = create(:dream_emotion, emotion: emotion, dream: dream)
      tag = create(:tag)
      dream_tag = create(:dream_tag, tag: tag, dream: dream)

      post '/graphql', params: { query: mutation(user) }

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:createDream]


      expect(data).to include(
        "userId" => user.id.to_s,
        "id" => dream.id.to_s,
        "dreamDate" => dream.dream_date.to_s,
        "title" => dream.title,
        "description" => dream.description,
        "emotions" => [
            "name" => emotion.name
          ],
        "tags" => [
            "name" => tag.name
          ],
        "lucidity" => dream.lucidity
      )
    end
  end

  def mutation(user_id)
    <<~GQL
    mutation {
      createDream(input: {
        userId: "#{user_id}",
        dreamDate: "2023-05-10",
        title: "My Dream Label",
        description: "A detailed description of my dream.",
        emotions: [ "Excitement", "Happiness" ],
        tags: ["Adventure", "Mystery"],
        lucidityLevel: 4
      }) {
        id
        dreamDate
        title
        description
        emotions {
          name
        }
        tags {
          name
        }
        lucidity
      }
    }
    GQL
  end
end