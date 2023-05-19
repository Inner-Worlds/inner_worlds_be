# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Getting a User\'s Stats", type: :request do
  describe 'when successful' do
    xit 'successfully returns one user\'s stats' do
      #TO DO
    end
  end

  describe 'when not successful' do
    xit 'some error message is returned' do
      #TO DO
    end
  end

  def query_user_stats(id)
    <<~GQL
      query{
        user(id: #{id}){
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