# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  2.times do  
    user = User.create( name: Faker::TvShows::VentureBros.character, email: Faker::Internet.email )
    3.times  do 
      dream = Dream.create( user: user)
      2.times do 
        emotion = Emotion.create(name: Faker::Music::UmphreysMcgee.song) 
        dream_emotion = DreamEmotion.create(dream: dream, emotion: emotion)
      end
      2.times do 
        tag = Tag.create(name: Faker::Creature::Animal.name) 
        dream_tag = DreamTag.create(tag: tag, dream: dream)
      end
    end
  end