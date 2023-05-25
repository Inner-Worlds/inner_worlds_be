# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicService, type: :service do
  describe 'instance methods' do
    before do
      @payload = 'Last night I had a terrible dream where a balloon art clown made a dog out of a balloon, and the dog came to life. I tried to bite the balloon dog with my teeth, but all of my teeth fell out. Then my bones turned into jello, and I became a deflated goo person.'
      @bad_payload = 'asdf'
    end

    describe '#get_topics' do
      it 'should return keywords and topics' do
        VCR.use_cassette('services/get_topics') do
          service = TopicService.new(@payload)
          response = service.get_topics
          expect(response).to be_an(Array)
          expect(response).to contain_exactly(:dog, :balloon, :teeth, :animal)
        end
      end

      it 'should return something for nonsense topics' do
        VCR.use_cassette('services/get_bad_topics') do
          service = TopicService.new(@bad_payload)
          response = service.get_topics
          expect(response).to be_an(Array)
        end
      end
    end
  end
end
