require "rails_helper"

RSpec.describe Dream, type: :request do 
  describe "Update a dream" do 
    before :each do 
      user = create(:user)
      @dream = create(:dream, lucidity: 3, user:)
      @new_title = "Help! I've fallen and I can't get up!"
      @new_description = "Clap on! Clap off!"
      @new_lucidity = 4
      @new_date = "5/28/2023"
    end
    describe "When Successful" do
      it "can update a dream" do 

        post "/graphql", params: { query: dream_mutation(id: @dream.id, title: @new_title, description: @new_description, lucidity: @new_lucidity, dream_date: @new_date) }

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        updated_dream = parsed_response[:data][:updateDream]

        expect(updated_dream[:title]).to_not eq(@dream.title)
        expect(updated_dream[:title]).to eq("Help! I've fallen and I can't get up!")

        expect(updated_dream[:description]).to_not eq(@dream.description)
        expect(updated_dream[:description]).to eq("Clap on! Clap off!")

        expect(updated_dream[:lucidity]).to_not eq(@dream.lucidity)
        expect(updated_dream[:lucidity]).to eq(4)
        
        expect(updated_dream[:dreamDate]).to eq(@new_date)
      end

      it "can update part of a dream" do 
        post "/graphql", params: { query: dream_mutation(id: @dream.id, description: @new_description, title: @dream.title, lucidity: @dream.lucidity, dream_date: "1/1/2022") }

        update_response = JSON.parse(response.body, symbolize_names: true)
        updated_dream = update_response[:data][:updateDream]
        
        expect(updated_dream[:description]).to_not eq(@dream.description)
        expect(updated_dream[:description]).to eq(@new_description)

        expect(updated_dream[:title]).to eq(@dream.title)
        expect(updated_dream[:lucidity]).to eq(@dream.lucidity)

        expect(updated_dream[:dreamDate]).to eq("1/1/2022")
      end
    end

    describe "When Unsuccessful" do 
      it "returns an error if the dream is updated with incorrect data types" do 
        post "/graphql", params: { query: dream_mutation(id: @dream.id, description: "", title: "", lucidity: @dream.lucidity, dream_date: "1/1/2022") }
        
        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(error_response).to have_key(:errors)
        expect(error_response[:errors]).to be_an(Array)

        expect(error_response[:errors].first[:message]).to eq("Invalid input: Description can't be blank, Title can't be blank")
      end
    end
  end

  def dream_mutation(id: , title: , description:, lucidity:, dream_date:)
    <<~GQL
    mutation{
      updateDream(input: {id: "#{id}", title: "#{title}", description: "#{description}", lucidity: #{lucidity}, dreamDate: "#{dream_date}"})
      {
      id
      dreamDate
      title
      description
      lucidity
      }
    }
    GQL
  end
end