# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicService, type: :service do
  describe 'instance methods', :vcr do
    before do
      @payload = "Last night I had a terrible dream where a balloon art clown made a dog out of a balloon, and the dog came to life. I tried to bite the balloon dog with my teeth, but all of my teeth fell out. Then my bones turned into jello, and I became a deflated goo person."
      @service = TopicService.new(@payload)
    end

    describe '#get_topics' do
      it 'should return keywords and topics' do
        response = @service.get_topics
        expect(response.keys).to contain_exactly(:keyword, :topic, :version, :author, :email, :result_code, :result_msg)
        expect(response[:keyword].keys).to include(:dog, :balloon, :teeth)
        expect(response[:keyword][:dog]).to be_an(Integer)
        expect(response[:topic][:animal]).to be_a(Float)
      end
    end
  end
end