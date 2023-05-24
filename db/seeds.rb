# frozen_string_literal: true

ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  next if table == 'ar_internal_metadata'

  ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
end

tag1 = Tag.create(name: 'Nature')
tag2 = Tag.create(name: 'Nightmares')
tag3 = Tag.create(name: 'Travel')
tag4 = Tag.create(name: 'Self-discovery')

emotion1 = Emotion.create(name: 'Happy')
emotion2 = Emotion.create(name: 'Scared')
emotion3 = Emotion.create(name: 'Angry')
emotion4 = Emotion.create(name: 'Excited')

weston = User.create(name: 'Weston Sandfort', email: 'sandfortw@gmail.com')
dream1 = Dream.create(user_id: weston.id, description: 'I was in a field of flowers.', lucidity: 3,
                      title: 'Field of Flowers', dream_date: '2023-05-21')
dream2 = Dream.create(user_id: weston.id, description: 'I was in a field of scorpions aahhhh.', lucidity: 2,
                      title: 'Field of Scorps', dream_date: '2023-05-22')
dream3 = Dream.create(user_id: weston.id, description: 'I was rock climbing, it was hella sweet!', lucidity: 4,
                      title: 'I Sent It!!!', dream_date: '2023-05-23')

DreamTag.create(dream_id: dream1.id, tag_id: tag1.id)
DreamTag.create(dream_id: dream1.id, tag_id: tag3.id)
DreamTag.create(dream_id: dream2.id, tag_id: tag2.id)
DreamTag.create(dream_id: dream2.id, tag_id: tag1.id)
DreamTag.create(dream_id: dream3.id, tag_id: tag3.id)
DreamTag.create(dream_id: dream3.id, tag_id: tag4.id)

DreamEmotion.create(dream_id: dream1.id, emotion_id: emotion1.id)
DreamEmotion.create(dream_id: dream1.id, emotion_id: emotion4.id)
DreamEmotion.create(dream_id: dream2.id, emotion_id: emotion2.id)
DreamEmotion.create(dream_id: dream2.id, emotion_id: emotion3.id)
DreamEmotion.create(dream_id: dream3.id, emotion_id: emotion1.id)
DreamEmotion.create(dream_id: dream3.id, emotion_id: emotion4.id)

bobby = User.create(name: 'Bobby Luly', email: 'bikerbob125@aol.com')
dream4 = Dream.create(user_id: bobby.id, description: 'I was floating in the endless cosmos.', lucidity: 5,
                      title: 'Lake of Stars', dream_date: '2023-05-21')
dream5 = Dream.create(user_id: bobby.id, description: 'I was getting chased by a clown.', lucidity: 2,
                      title: 'Clowns are Whack', dream_date: '2023-05-22')
dream6 = Dream.create(user_id: bobby.id,
                      description: 'I was at an all inclusive beach-side music festival! It was glorious!', lucidity: 4, title: 'Mayan Holidaze', dream_date: '2023-05-23')

DreamTag.create(dream_id: dream4.id, tag_id: tag1.id)
DreamTag.create(dream_id: dream4.id, tag_id: tag3.id)
DreamTag.create(dream_id: dream5.id, tag_id: tag2.id)
DreamTag.create(dream_id: dream5.id, tag_id: tag3.id)
DreamTag.create(dream_id: dream6.id, tag_id: tag3.id)
DreamTag.create(dream_id: dream6.id, tag_id: tag4.id)

DreamEmotion.create(dream_id: dream4.id, emotion_id: emotion1.id)
DreamEmotion.create(dream_id: dream4.id, emotion_id: emotion4.id)
DreamEmotion.create(dream_id: dream5.id, emotion_id: emotion2.id)
DreamEmotion.create(dream_id: dream5.id, emotion_id: emotion3.id)
DreamEmotion.create(dream_id: dream6.id, emotion_id: emotion1.id)
DreamEmotion.create(dream_id: dream6.id, emotion_id: emotion4.id)

# 10.times do
#   user = User.create(name: Faker::TvShows::VentureBros.character, email: Faker::Internet.email)
#   3.times do
#     dream = Dream.create(user_id: user.id, description: Faker::Movies::Ghostbusters.quote,
#                          lucidity: Faker::Number.within(range: 1..5), title: Faker::Movies::PrincessBride.character, dream_date: Faker::Date.in_date_period)
#     2.times do
#       emotion = Emotion.create(name: Faker::Emotion.adjective)
#       DreamEmotion.create(dream_id: dream.id, emotion_id: emotion.id)
#     end
#     2.times do
#       tag = Tag.create(name: Faker::Emotion.noun)
#       DreamTag.create(tag_id: tag.id, dream_id: dream.id)
#     end
#   end
# end

default_emotions = %w[
  Happy
  Sad
  Angry
  Scared
  Excited
  Confused
  Relaxed
  Hopeful
  Content
  Anxious
  Curious
  Overwhelmed
  Frustrated
  Nostalgic
  Empathetic
  Contentment
  Enthusiasm
  Boredom
  Inspired
  Grateful
  Miserable
]

default_emotions.each do |emotion|
  Emotion.create(name: emotion, default: true)
end

default_tags = [
  'Flying',
  'Falling',
  'Chased',
  'Lost',
  'Late',
  'Losing teeth',
  'Naked',
  'School',
  'Work',
  'Car accident',
  'Fire',
  'Water',
  'Tornadoes',
  'Meeting someone famous',
  'Deceased loved one',
  'Strange place',
  'Nature',
  'Science Fiction',
  'Travel',
  'Relationships',
  'Self-discovery',
  'Nightmares',
  'Night Terrors',
  'Food',
  'Music',
  'Supernatural',
  'Sleep Paralysis',
  'Dreams within Dreams'
]

default_tags.each do |tag|
  Tag.create(name: tag, default: true)
end
