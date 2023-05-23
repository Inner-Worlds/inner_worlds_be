class Mutations::CreateDream < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :title, String, required: true
  argument :description, String, required: true
  argument :emotions, [String], required: false
  argument :tags, [String], required: false
  argument :lucidity_level, Int, required: false
  argument :dream_date, String, required: true

  type Types::DreamType
  
  def resolve(user_id:, title:, description:, emotions: [], tags: [], lucidity_level: nil, dream_date:, **_args)
    user = User.find_by_id(user_id)
    raise GraphQL::ExecutionError, "User not found" unless user
    
    dream = Dream.create!(
      user_id: user_id,
      description: description,
      lucidity: lucidity_level,
      title: title,
      dream_date: Date.parse(dream_date),
    )

    emotions = emotions.map do |name| 
      new_emotion = Emotion.find_or_create_by(name: name)
      dream_emotions = DreamEmotion.create!(dream_id: dream.id, emotion_id: new_emotion.id)
    end

    # tags = tags.map do |name| 
    #   new_tag = Tag.find_or_create_by(name: name)
    #   dream_tag = DreamTag.create!(dream_id: dream.id, tag_id: new_tag.id)
    # end

    TagFacade.new(dream, tags).generate_tags

    dream
  end
end
