require 'rails_helper'

RSpec.describe Mutations::AddTag, type: :request do
  describe '.resolve' do
    context "happy paths" do
      before do
        @user = create(:user)
        @dream = create(:dream, user_id: @user.id)
        @name = "new tag"
  
        post '/graphql', params: { query: mutation(dream_id: @dream.id, name: @name) }
        json = JSON.parse(response.body, symbolize_names: true)
        @data = json[:data][:addTag]
        @new_tag = Tag.last
        @dream_tag = DreamTag.last
      end
      it 'creates a new tag' do
        expect(@data[:dreamTag][:tag][:id]).to eq(@new_tag.id.to_s)
        expect(@data[:dreamTag][:dream][:id]).to eq(@dream.id.to_s)
        expect(@data[:errors]).to eq([])
        expect(@new_tag.name).to eq(@name)
        expect(@dream_tag.dream_id).to eq(@dream.id)
        expect(@dream_tag.tag_id).to eq(@new_tag.id)
      end

      it 'reuses a tag if it already exists' do
        post '/graphql', params: { query: mutation(dream_id: @dream.id, name: "new tag") }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:addTag]
        new_tag_2 = Tag.last
        dream_tag_2 = DreamTag.last
        expect(new_tag_2).to eq(@new_tag)
      end
    end

    it 'can return an error' do
      post '/graphql', params: { query: mutation(dream_id: "abc", name: "123") }
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:addTag]
      expect(data[:errors]).to_not be_empty
    end
  end
  

  def mutation(dream_id:, name:)
    <<~GQL
      mutation {
        addTag(input: { dreamId: "#{dream_id}", name: "#{name}" }) {
          dreamTag {
            dream{
              id
            }
            tag{
              id
            }
          }
          errors
        }
      }
    GQL
  end
end