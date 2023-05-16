require 'rails_helper'

RSpec.describe Mutations::DeleteUser, type: :request do
  describe '.resolve' do
    it 'removes a user' do
      user = create(:user)

      post '/graphql', params: { query: query(id: user.id) }
    end

    def mutation(user_id)
      <<~GQL
        mutation{
          deleteUser(input: {id: #{dream_id}}){
            id
            title
          }
        }
      GQL
    end
  end
end