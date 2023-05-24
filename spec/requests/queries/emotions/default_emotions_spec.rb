# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Emotion, type: :request do
  describe 'default_emotions query' do
    describe 'when successful' do
      it 'returns all emotions with a default value of true' do
        Emotion.create!(name: 'Happy', default: true)
        Emotion.create!(name: 'Sad', default: true)
        Emotion.create!(name: 'Horny', default: false)
        Emotion.create!(name: 'Exuberant', default: true)
        Emotion.create!(name: 'Dead', default: false)

        post '/graphql', params: { query: query_default_emotions }

        emotion_response = JSON.parse(response.body, symbolize_names: true)

        emotion_data = emotion_response[:data][:defaultEmotions]
        expect(emotion_data).to be_an(Array)
        expect(emotion_data.count).to eq(3)
        emotion_data.each do |emotion|
          expect(emotion).to have_key(:name)
          expect(emotion[:name]).to be_a(String)
        end
      end

      def query_default_emotions
        <<~GQL
          query {
            defaultEmotions {
              name
            }
          }
        GQL
      end
    end
  end
end
