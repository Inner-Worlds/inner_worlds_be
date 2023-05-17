ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
end

100.times do
  user = User.create(name: Faker::TvShows::VentureBros.character, email: Faker::Internet.email)
  3.times do
    dream = Dream.create(user_id: user.id, description: Faker::Movies::Ghostbusters.quote,
                         lucidity: Faker::Number.within(range: 1..5), title: Faker::Movies::PrincessBride.character, dream_date: Faker::Date.in_date_period)
    2.times do
      emotion = Emotion.create(name: Faker::Music::UmphreysMcgee.song)
      DreamEmotion.create(dream_id: dream.id, emotion_id: emotion.id)
    end
    2.times do
      tag = Tag.create(name: Faker::Creature::Animal.name)
      DreamTag.create(tag_id: tag.id, dream_id: dream.id)
    end
  end
end
