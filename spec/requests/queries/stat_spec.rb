# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatType, type: :request do
  describe 'get all stats' do

    before do
      post '/graphql', params: { query: query_user_stats }
    end
    it 'should return the number of dreams recorded this month' do

    end
  end
end