# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'Get one user' do
    describe "when successful" do 
      it 'successfully returns one user' do
        user = create(:user)
        dream = create(:dream, user:)
        emotion = create(:emotion)
        create(:dream_emotion, emotion:, dream:)
        tag = create(:tag)
        create(:dream_tag, tag:, dream:)

        post '/graphql', params: { query: query_user(user.id) }

        user_response = JSON.parse(response.body, symbolize_names: true)
       
        user_data = user_response[:data][:user]
        expect(user_data).to have_key(:name)
        expect(user_data[:name]).to be_a(String)

        expect(user_data).to have_key(:email)
        expect(user_data[:email]).to be_a(String)

        expect(user_data).to have_key(:dreams)
        expect(user_data[:dreams]).to be_an(Array)

        user_data[:dreams].each do |dream|
          expect(dream).to have_key(:title)
          expect(dream[:title]).to be_a(String)

          expect(dream).to have_key(:description)
          expect(dream[:description]).to be_a(String)

          expect(dream).to have_key(:lucidity)
          expect(dream[:lucidity]).to be_an(Integer)

          expect(dream).to have_key(:dreamDate)
          expect(dream[:dreamDate]).to be_a(String)

          expect(dream).to have_key(:emotions)
          expect(dream[:emotions]).to be_an(Array)
          dream[:emotions].each do |emotion|
            expect(emotion).to have_key(:name)
            expect(emotion[:name]).to be_a(String)
          end
          expect(dream).to have_key(:tags)
          expect(dream[:tags]).to be_an(Array)
          dream[:tags].each do |tag|
            expect(tag).to have_key(:name)
            expect(tag[:name]).to be_a(String)
          end
        end
      end

      describe "when unsuccessful" do 
        it "returns an error response if the user does not exist" do 
          post '/graphql', params: { query: query_user(12) }

          error_response = JSON.parse(response.body, symbolize_names: true)

          expect(error_response).to have_key(:errors)
          expect(error_response[:errors]).to be_an(Array)
          expect(error_response[:errors].first).to have_key(:message)
          expect(error_response[:errors].first[:message]).to eq("User not found")
        end
      end
    end
  end

  def query_user(id)
    <<~GQL
      query{
        user(id: #{id}){
          name
          email
          dreams {
            title
            description
            lucidity
            dreamDate
            emotions {
              name
            }
            tags {
              name
            }
          }
        }
      }
    GQL
  end
end
