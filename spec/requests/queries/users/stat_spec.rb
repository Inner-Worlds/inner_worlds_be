# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :request do
  describe "Getting a User's Stats" do
    context 'when successful' do
      before do
        @user = create(:user)
        @dream1 = create(:dream, user: @user)
        @dream2 = create(:dream, user: @user)
        @dream3 = create(:dream, user: @user)
        @dream4 = create(:dream, user: @user)

        @tag1 = create(:tag, name: 'happy')
        @tag2 = create(:tag, name: 'sad')
        @tag3 = create(:tag, name: 'angry')
        @tag4 = create(:tag, name: 'melancholy')
        @tag5 = create(:tag, name: 'somber')
        @tag6 = create(:tag, name: 'joyful')
        @tag7 = create(:tag, name: 'anxious')

        @emotion1 = create(:emotion, name: 'joyous')
        @emotion2 = create(:emotion, name: 'upset')
        @emotion3 = create(:emotion, name: 'mad')
        @emotion4 = create(:emotion, name: 'anxiety')
        @emotion5 = create(:emotion, name: 'scared')
        @emotion6 = create(:emotion, name: 'guilty')
        @emotion7 = create(:emotion, name: 'embarrassed')

        DreamEmotion.create(dream: @dream1, emotion: @emotion1)
        DreamEmotion.create(dream: @dream1, emotion: @emotion2)
        DreamEmotion.create(dream: @dream1, emotion: @emotion3)

        DreamEmotion.create(dream: @dream2, emotion: @emotion1)
        DreamEmotion.create(dream: @dream2, emotion: @emotion5)

        DreamEmotion.create(dream: @dream3, emotion: @emotion1)
        DreamEmotion.create(dream: @dream3, emotion: @emotion2)
        DreamEmotion.create(dream: @dream3, emotion: @emotion4)

        DreamEmotion.create(dream: @dream4, emotion: @emotion1)
        DreamEmotion.create(dream: @dream4, emotion: @emotion2)
        DreamEmotion.create(dream: @dream4, emotion: @emotion3)

        DreamTag.create(dream: @dream1, tag: @tag1)
        DreamTag.create(dream: @dream1, tag: @tag2)
        DreamTag.create(dream: @dream1, tag: @tag3)

        DreamTag.create(dream: @dream2, tag: @tag1)
        DreamTag.create(dream: @dream2, tag: @tag5)

        DreamTag.create(dream: @dream3, tag: @tag1)
        DreamTag.create(dream: @dream3, tag: @tag2)
        DreamTag.create(dream: @dream3, tag: @tag4)

        DreamTag.create(dream: @dream4, tag: @tag1)
        DreamTag.create(dream: @dream4, tag: @tag2)
        DreamTag.create(dream: @dream4, tag: @tag3)
      end

      it "successfully returns a user's top 5 tag stats" do
        post '/graphql', params: { query: query_user_stats(@user.id) }

        user_response = JSON.parse(response.body, symbolize_names: true)
        user_data = user_response[:data][:user][:stats]

        expect(user_data).to have_key(:top5Tags)
        expect(user_data[:top5Tags]).to be_an(Array)
        expect(user_data[:top5Tags].count).to eq(6)

        user_data[:top5Tags].each do |tag|
          expect(tag).to have_key(:name)
          expect(tag[:name]).to be_a(String)

          expect(tag).to have_key(:frequency)
          expect(tag[:frequency]).to be_an(Integer)

          expect(tag).to have_key(:percent)
          expect(tag[:percent]).to be_a(Float)
        end

        expect(user_data[:top5Tags].first[:name]).to eq(@tag1.name)
        expect(user_data[:top5Tags].first[:frequency]).to eq(4)
        expect(user_data[:top5Tags].first[:percent]).to eq(36.36)
      end

      it "successfully returns a user's top 5 emotion stats" do
        post '/graphql', params: { query: query_user_stats(@user.id) }

        user_response = JSON.parse(response.body, symbolize_names: true)
        user_data = user_response[:data][:user][:stats]

        expect(user_data).to have_key(:top5Emotions)
        expect(user_data[:top5Emotions]).to be_an(Array)
        expect(user_data[:top5Emotions].count).to eq(6)

        user_data[:top5Emotions].each do |tag|
          expect(tag).to have_key(:name)
          expect(tag[:name]).to be_a(String)

          expect(tag).to have_key(:frequency)
          expect(tag[:frequency]).to be_an(Integer)

          expect(tag).to have_key(:percent)
          expect(tag[:percent]).to be_a(Float)
        end

        expect(user_data[:top5Emotions].first[:name]).to eq(@emotion1.name)
        expect(user_data[:top5Emotions].first[:frequency]).to eq(4)
        expect(user_data[:top5Emotions].first[:percent]).to eq(36.36)
      end

      it 'should return a value for each of the stats' do
        post '/graphql', params: { query: query_user_stats(@user.id) }

        user_response = JSON.parse(response.body, symbolize_names: true)
        user_data = user_response[:data][:user][:stats]
        expect(user_data.keys).to contain_exactly(:currentStreak, :longestStreak, :dreamNumMonth,
                                                  :dreamNumWeek, :totalDreams, :averageLucidity,
                                                  :top5Emotions, :top5Tags)
      end
    end
  end

  def query_user_stats(user_id)
    <<~GQL
      query{
        user(id: #{user_id}){
          stats{
            currentStreak
            longestStreak
            dreamNumMonth
            dreamNumWeek
          	totalDreams
            averageLucidity
            top5Emotions{
              name
              frequency
              percent
            }
            top5Tags{
              name
              frequency
              percent
            }
          }
        }
      }
    GQL
  end
end
