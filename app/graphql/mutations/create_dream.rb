class Mutations::CreateDream < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :title, String, required: true
  argument :description, String, required: true
  argument :emotions, [String], required: false
  argument :tags, [String], required: false
  argument :lucidity_level, Int, required: false
  argument :dream_date, String, required: true

  field :tag, Types::TagType

  type Types::DreamType
  
  def resolve(user_id:, title:, description:, emotions: [], tags: [], lucidity_level: nil, dream_date:, **_args)
    user = User.find_by_id(user_id)
    dream = Dream.create!(
      user_id: user_id,
      description: description,
      lucidity: lucidity_level,
      title: title,
      dream_date: Date.parse(dream_date),
    )

    tags = tags.map do |name| 
      new_tag = Tag.find_or_create_by(name: name)
      dream_tag = DreamTag.create!(dream_id: dream.id, tag_id: new_tag.id)
    end
    dream
  end
end
