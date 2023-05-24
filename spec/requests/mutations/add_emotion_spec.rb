# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::AddEmotion, type: :request do
  describe '.resolve' do
    context 'happy paths' do
      before do
        @user = create(:user)
        @dream = create(:dream, user_id: @user.id)
        @name = 'new emotion'

        post '/graphql', params: { query: mutation(dream_id: @dream.id, name: @name) }
        json = JSON.parse(response.body, symbolize_names: true)

        @data = json[:data][:addEmotion]
        @new_emotion = Emotion.last
        @dream_emotion = DreamEmotion.last
      end

      it 'creates a new tag' do
        expect(@data[:dreamEmotion][:emotion][:id]).to eq(@new_emotion.id.to_s)
        expect(@data[:dreamEmotion][:dream][:id]).to eq(@dream.id.to_s)
        expect(@data[:errors]).to eq([])
        expect(@new_emotion.name).to eq(@name)
        expect(@dream_emotion.dream_id).to eq(@dream.id)
        expect(@dream_emotion.emotion_id).to eq(@new_emotion.id)
      end

      it 'reuses a tag if it already exists' do
        post '/graphql', params: { query: mutation(dream_id: @dream.id, name: 'new emotion') }
        json = JSON.parse(response.body, symbolize_names: true)
        json[:data][:addTag]
        new_emotion_2 = Emotion.last
        DreamEmotion.last

        expect(new_emotion_2).to eq(@new_emotion)
      end
    end

    it 'can return an error' do
      post '/graphql', params: { query: mutation(dream_id: 'abc', name: '123') }
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:addEmotion]

      expect(data[:errors]).to_not be_empty
    end
  end

  def mutation(dream_id:, name:)
    <<~GQL
      mutation {
        addEmotion(input: { dreamId: "#{dream_id}", name: "#{name}" }) {
          dreamEmotion {
            dream {
              id
            }
            emotion {
              id
            }
          }
          errors
        }
      }
    GQL
  end
end
