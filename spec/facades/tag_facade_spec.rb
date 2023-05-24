# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagFacade do
  describe '#generate_tags' do
    it 'should generate tags from a user description and given tags' do
      VCR.use_cassette('facades/tag_facade') do
        user = create(:user)
        dream = create(:dream, user:,
                               description: "how much is that doggie in the window? The one with the waggily tail. How much is that doggie in the window? I do hope that doggie's for sale.")
        user_tags = %w[cheese apple orange]
        facade = TagFacade.new(dream, user_tags)
        facade.generate_tags

        expect(user.dreams.first.tags.size).to eq(7)
        expect(user.dreams.first.tags.pluck(:name)).to eq(%w[cheese apple orange window tail hope
                                                             door])
      end
    end
  end
end
