# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dream, type: :request do
  describe '.resolve' do
    it 'creates a dream' do
      VCR.use_cassette('services/create_dream') do
        user = create(:user)

        expect do
          post '/graphql', params: { query: mutation(user) }
        end.to change { Dream.count }.by(1)
      end
    end

    it 'returns a dream' do
      VCR.use_cassette('services/create_dream') do
        user = create(:user)

        post '/graphql', params: { query: mutation(user) }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:createDream]

        expect(data).to include(
          id: be_present,
          dreamDate: '5/10/2023',
          title: 'My Dream Label',
          description: 'A detailed description of my dream.',
          emotions: [
            { name: 'Excitement' },
            { name: 'Happiness' }
          ],
          tags: be_present,
          lucidity: 4
        )
        expect(data[:tags].size).to eq(6)
        expect(data[:tags]).to include({ name: 'adventure' }, { name: 'mystery' })
      end
    end
  end

  def mutation(user)
    <<~GQL
      mutation {
        createDream(input: {
          userId: "#{user.id}",
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
