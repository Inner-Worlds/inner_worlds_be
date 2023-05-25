# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :dreams }
    it { should have_many(:dream_emotions).through(:dreams) }
    it { should have_many(:dream_tags).through(:dreams) }
    it { should have_many(:emotions).through(:dream_emotions) }
    it { should have_many(:tags).through(:dream_tags) }
  end

  let(:user) { create(:user) }

  describe '#sorted_dreams_date_asc' do
    it 'should return an array of dreams in order by date from oldest to newest' do
      dream1 = create(:dream, dream_date: DateTime.new(2023), user:)
      dream2 = create(:dream, dream_date: DateTime.new(1999), user:)
      dream3 = create(:dream, dream_date: DateTime.new(2001), user:)
      dream4 = create(:dream, dream_date: DateTime.new(2003), user:)
      dream5 = create(:dream, dream_date: DateTime.new(2024), user:)
      expect(user.sorted_dreams_date_asc).to eq([dream2, dream3, dream4, dream1, dream5])
    end
  end

  describe '#current_streak' do
    it 'should return the current streak for a user recording dreams' do
      create(:dream, dream_date: Date.today, user:)
      create(:dream, dream_date: (Date.today - 1), user:)
      create(:dream, dream_date: (Date.today - 2), user:)
      create(:dream, dream_date: (Date.today - 3), user:)
      create(:dream, dream_date: DateTime.new(2024, 1, 6), user:)
      expect(user.current_streak).to eq(4)
      expect(user.current_streak).to be_an(Integer)
    end
  end

  describe '#longest_streak' do
    it 'should return the longest streak for a user recording dream' do
      create(:dream, dream_date: DateTime.new(2023, 1, 1), user:)
      create(:dream, dream_date: DateTime.new(2023, 1, 2), user:)
      create(:dream, dream_date: DateTime.new(2023, 1, 3), user:)
      create(:dream, dream_date: DateTime.new(2023, 1, 4), user:)
      create(:dream, dream_date: DateTime.new(2024, 1, 6), user:)
      expect(user.longest_streak).to be_an(Integer)
      expect(user.longest_streak).to eq(4)
    end
  end

  describe '#dreams_this_week' do
    context 'for each user with dreams' do
      it 'should return the number of dreams recorded this week' do
        user = create(:user)
        dream1 = create(:dream, user: user, dream_date: DateTime.new(2023, 05, 01))
        dream2 = create(:dream, user: user, dream_date: DateTime.new(2023, 05, 22))
        dream3 = create(:dream, user: user, dream_date: DateTime.new(2023, 05, 23))
        dream4 = create(:dream, user: user, dream_date: DateTime.new(2023, 05, 24))
        dream5 = create(:dream, user: user, dream_date: DateTime.new(2023, 05, 25))
        dream6 = create(:dream, user: user, dream_date: DateTime.new(2023, 05, 27))
        dream7 = create(:dream, user: user, dream_date: DateTime.new(2023, 06, 02))
        dream8 = create(:dream, user: user, dream_date: DateTime.new(2023, 04, 30))
        

        expect(user.dreams_this_week).to eq(5)
      end

      it 'should return 0 if there are no dreams this week' do
        user = create(:user)

        expect(user.dreams_this_week).to eq(0)
      end
    end
  end

  describe '#total_dreams' do
    it 'should return the total dreams recorded by a user' do
      user = create(:user)
      create_list(:dream, 5, user:)

      expect(user.total_dreams).to be_an(Integer)
      expect(user.total_dreams).to eq(5)
    end

    it 'should return 0 when the user has no recorded dreams' do
      user = create(:user)

      expect(user.total_dreams).to eq(0)
    end
  end

  describe '#average_weekly_lucidity' do
    it 'should return average lucidity for the week' do
      Timecop.freeze(Date.new(2023, 05, 24)) do
        user = create(:user)

        dream1 = create(:dream, lucidity: 3, user: user, dream_date: Date.today + 1)
        dream2 = create(:dream, lucidity: 2, user: user, dream_date: Date.today + 2)
        dream3 = create(:dream, lucidity: 4, user: user, dream_date: Date.today + 3)
        
        week_start_date = Date.today.beginning_of_week(:sunday)
        week_end_date = week_start_date + 6
    
        average = (dream1.lucidity + dream2.lucidity + dream3.lucidity).to_f / 3

        expect(user.average_lucidity).to be_a(Float)
        expect(user.average_lucidity).to eq(average.round(2))
      end
    end
  
    it 'should return 0 when the user has dreams but all have lucidity level 0' do
      user = create(:user)
      create_list(:dream, 3, user: user, lucidity: 0)
  
      week_start_date = Date.today.beginning_of_week(:sunday)
      week_end_date = week_start_date + 6
      
      expect(user.average_lucidity).to eq(0)
    end
  end

  describe '#top_5_emotions' do
    context 'for each user with dreams' do
      it 'should return an array of hashes of the top 5 emotion names with frequency and percent of whole' do
        user_1 = create(:user)
        dream1 = create(:dream, user: user_1)
        dream2 = create(:dream, user: user_1)
        dream3 = create(:dream, user: user_1)
        dream4 = create(:dream, user: user_1)

        emotion1 = create(:emotion, name: 'happy')
        emotion2 = create(:emotion, name: 'sad')
        emotion3 = create(:emotion, name: 'angry')
        emotion4 = create(:emotion, name: 'guilty')
        emotion5 = create(:emotion, name: 'love')
        emotion6 = create(:emotion, name: 'joyful')
        emotion7 = create(:emotion, name: 'anxious')

        DreamEmotion.create(dream: dream1, emotion: emotion1)
        DreamEmotion.create(dream: dream1, emotion: emotion2)
        DreamEmotion.create(dream: dream1, emotion: emotion3)
        DreamEmotion.create(dream: dream1, emotion: emotion4)

        DreamEmotion.create(dream: dream2, emotion: emotion1)
        DreamEmotion.create(dream: dream2, emotion: emotion5)

        DreamEmotion.create(dream: dream3, emotion: emotion1)
        DreamEmotion.create(dream: dream3, emotion: emotion2)
        DreamEmotion.create(dream: dream3, emotion: emotion4)
        DreamEmotion.create(dream: dream3, emotion: emotion5)

        DreamEmotion.create(dream: dream4, emotion: emotion1)
        DreamEmotion.create(dream: dream4, emotion: emotion2)
        DreamEmotion.create(dream: dream4, emotion: emotion3)

        DreamEmotion.create(dream: dream4, emotion: emotion1)
        DreamEmotion.create(dream: dream4, emotion: emotion2)
        DreamEmotion.create(dream: dream4, emotion: emotion3)
        DreamEmotion.create(dream: dream4, emotion: emotion6)
        DreamEmotion.create(dream: dream4, emotion: emotion7)

        user_2 = create(:user)
        dream5 = create(:dream, user: user_2)
        dream6 = create(:dream, user: user_2)
        dream7 = create(:dream, user: user_2)

        DreamEmotion.create(dream: dream5, emotion: emotion1)
        DreamEmotion.create(dream: dream5, emotion: emotion2)

        DreamEmotion.create(dream: dream6, emotion: emotion1)
        DreamEmotion.create(dream: dream6, emotion: emotion2)

        DreamEmotion.create(dream: dream7, emotion: emotion1)
        DreamEmotion.create(dream: dream7, emotion: emotion3)

        expect(user_1.top_5_emotions).to be_an(Array)
        expect(user_1.top_5_emotions.sample).to be_a(Hash)
        expect(user_1.top_5_emotions.sample.keys).to contain_exactly(:name, :frequency, :percent)
        expect(user_1.top_5_emotions.size).to eq(6)
        expect(user_1.top_5_emotions).to eq([{ name: 'happy', frequency: 5, percent: 27.78 },
                                             { name: 'sad', frequency: 4, percent: 22.22 },
                                             { name: 'angry', frequency: 3, percent: 16.67 },
                                             { name: 'guilty', frequency: 2, percent: 11.11 },
                                             { name: 'love', frequency: 2, percent: 11.11 },
                                             { name: 'other', frequency: 2, percent: 11.11 }])
        expect(user_1.top_5_emotions.sample[:name]).to_not include(emotion6.name, emotion7.name)
      end
    end
  end

  describe '#top_5_tags' do
    context 'for each user with dreams' do
      it 'should return an array of hashes of the top 5 tag names with frequency and percent of whole' do
        user_2 = create(:user)
        dream1 = create(:dream, user: user_2)
        dream2 = create(:dream, user: user_2)
        dream3 = create(:dream, user: user_2)
        dream4 = create(:dream, user: user_2)

        tag1 = create(:tag, name: 'happy')
        tag2 = create(:tag, name: 'sad')
        tag3 = create(:tag, name: 'angry')
        tag4 = create(:tag, name: 'melancholy')
        tag5 = create(:tag, name: 'somber')
        tag6 = create(:tag, name: 'joyful')
        tag7 = create(:tag, name: 'anxious')

        DreamTag.create(dream: dream1, tag: tag1)
        DreamTag.create(dream: dream1, tag: tag2)
        DreamTag.create(dream: dream1, tag: tag3)

        DreamTag.create(dream: dream2, tag: tag1)
        DreamTag.create(dream: dream2, tag: tag5)

        DreamTag.create(dream: dream3, tag: tag1)
        DreamTag.create(dream: dream3, tag: tag2)
        DreamTag.create(dream: dream3, tag: tag4)

        DreamTag.create(dream: dream4, tag: tag1)
        DreamTag.create(dream: dream4, tag: tag2)
        DreamTag.create(dream: dream4, tag: tag3)

        user_3 = create(:user)
        dream5 = create(:dream, user: user_3)
        dream6 = create(:dream, user: user_3)
        dream7 = create(:dream, user: user_3)

        DreamTag.create(dream: dream5, tag: tag1)
        DreamTag.create(dream: dream5, tag: tag2)

        DreamTag.create(dream: dream6, tag: tag1)
        DreamTag.create(dream: dream6, tag: tag2)

        DreamTag.create(dream: dream7, tag: tag1)
        DreamTag.create(dream: dream7, tag: tag3)

        expect(user_2.top_5_tags).to be_an(Array)
        expect(user_2.top_5_tags.sample).to be_a(Hash)
        expect(user_2.top_5_tags.sample.keys).to contain_exactly(:name, :frequency, :percent)
        expect(user_2.top_5_tags.size).to eq(6)
        expect(user_2.top_5_tags).to eq([{ name: 'happy', frequency: 4, percent: 36.36 },
                                         { name: 'sad', frequency: 3, percent: 27.27 },
                                         { name: 'angry', frequency: 2, percent: 18.18 },
                                         { name: 'melancholy', frequency: 1, percent: 9.09 },
                                         { name: 'somber', frequency: 1, percent: 9.09 },
                                         { name: 'other', frequency: 0, percent: 0 }])
        expect(user_2.top_5_tags.sample[:name]).to_not include(tag6.name, tag7.name)

        expect(user_3.top_5_tags.size).to eq(4)
        expect(user_3.top_5_tags).to eq([{ name: 'happy', frequency: 3, percent: 50.0 },
                                         { name: 'sad', frequency: 2, percent: 33.33 }, { name: 'angry', frequency: 1, percent: 16.67 }, { name: 'other', frequency: 0, percent: 0 }])
        expect(user_3.top_5_tags.sample[:name]).to_not include(tag4.name, tag5.name, tag6.name, tag7.name)
      end
    end
  end

  describe '#dreams_this_month' do
    context 'for each user with dreams' do
      it 'should return the number of dreams recorded this month' do
        user = create(:user)
        create(:dream, user:, dream_date: DateTime.new(2023, 0o2, 20))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o5, 23))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o5, 24))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o5, 25))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o5, 26))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o5, 27))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o5, 28))
        create(:dream, user:, dream_date: DateTime.new(2023, 0o4, 30))

        expect(user.dreams_this_month).to eq(6)
      end

      it 'should return 0 if there are no dreams this month' do
        user = create(:user)

        expect(user.dreams_this_month).to eq(0)
      end
    end
  end
end
