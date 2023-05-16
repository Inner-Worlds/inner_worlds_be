User.delete_all
Dream.delete_all
DreamEmotion.delete_all
DreamTag.delete_all
Tag.delete_all
Emotion.delete_all


# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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
