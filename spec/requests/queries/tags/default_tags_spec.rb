# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :request do
  describe 'Get all default tags' do
    context 'when successful' do
      it 'returns all default tags' do
        happy = Tag.create(name: 'happy', default: true)
        sad = Tag.create(name: 'sad', default: true)
        angry = Tag.create(name: 'angry', default: true)

        melancholy = Tag.create(name: 'melancholy')
        somber = Tag.create(name: 'somber')

        post '/graphql', params: { query: query_default_tags }

        tags_response = JSON.parse(response.body, symbolize_names: true)
        tags_data = tags_response[:data][:defaultTags]

        expect(tags_data).to be_an(Array)
        expect(tags_data.count).to eq(3)

        expect(tags_data.first.keys).to eq(%i[id name])
        expect(tags_data.first[:id]).to eq(happy.id.to_s)
        expect(tags_data.first[:name]).to eq(happy.name)

        expect(tags_data.second.keys).to eq(%i[id name])
        expect(tags_data.second[:id]).to eq(sad.id.to_s)
        expect(tags_data.second[:name]).to eq(sad.name)

        expect(tags_data.third.keys).to eq(%i[id name])
        expect(tags_data.third[:id]).to eq(angry.id.to_s)
        expect(tags_data.third[:name]).to eq(angry.name)

        expect(tags_data).to_not include(melancholy, somber)
      end

      def query_default_tags
        <<~GQL
          query{
            defaultTags{
              id
              name
            }
          }
        GQL
      end
    end
  end
end
