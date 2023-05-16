require "rails_helper"

RSpec.describe User, type: :request do 
  describe "Get one user" do 
    it "successfully returns one user" do 
      user = create(:user)
      dream = create(:dream, user: user)
      emotion = create(:emotion)
      dream_emotion = create(:dream_emotion, emotion: emotion, dream: dream)
      tag = create(:tag)
      dream_tag = create(:dream_tag, tag: tag, dream: dream)

      post "/graphql", params: { query: query_user(user.id)}
      
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