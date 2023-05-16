require 'rails_helper'

RSpec.describe Mutations::DestroyUser, type: :request do
  describe '.resolve' do
    it 'removes a user' do
      user = create(:user)

      post '/graphql', params: { query: query(id: user.id) }
    end
  end
end