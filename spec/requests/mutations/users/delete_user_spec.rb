# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Users::DeleteUser, type: :request do
  describe '.resolve' do
    it 'removes a user by user id' do
      user = create(:user)

      post '/graphql', params: { query: mutation(user.id) }
      deletion_data = JSON.parse(response.body, symbolize_names: true)

      expect(User.count).to eq(0)
      expect(deletion_data[:data][:deleteUser][:id].to_i).to eq(user.id)
      expect(deletion_data[:data][:deleteUser][:email]).to eq(user.email)
      expect(deletion_data[:data][:deleteUser].keys).to eq(%i[id email])
    end

    def mutation(user_id)
      <<~GQL
        mutation{
          deleteUser(input: {id: #{user_id}}){
            id
            email
          }
        }
      GQL
    end
  end
end
