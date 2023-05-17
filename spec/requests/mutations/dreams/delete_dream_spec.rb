# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dream, type: :request do
  describe 'Get one user' do
    it 'can delete a dream' do
      user = create(:user)
      dream = create(:dream, user:)
      emotion = create(:emotion)
      create(:dream_emotion, emotion:, dream:)
      tag = create(:tag)
      create(:dream_tag, tag:, dream:)

      expect(Dream.count).to eq(1)

      post '/graphql', params: { query: mutation(dream.id) }

      user_response = JSON.parse(response.body, symbolize_names: true)
      deleted_data = user_response[:data][:deleteDream]
 
      expect(Dream.count).to eq(0)
      expect(deleted_data.keys).to eq(%i[id title])
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
