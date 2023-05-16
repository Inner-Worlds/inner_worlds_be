class Mutations::AddTag < Mutations::BaseMutation
  argument :dream_id, ID
  argument :name, String

  field :tag, Types::TagType
  field :dreamTag, Types::DreamTagType
  field :errors, [String], null: false


  def resolve(name:, dream_id:)
    dream = Dream.find_by_id(dream_id)
    
    return error_response('Dream not found') unless dream
    
    tag = dream.tags.build(name: name)
    
    return error_response(tag.errors.full_messages) unless tag.save
    
    dream_tag = DreamTag.create(dream_id: dream.id, tag_id: tag.id)
    
    {
      dreamTag: dream_tag,
      tag: tag,
      errors: [],
    }
  end
  
  private
  
  def error_response(message)
    { dreamTag: nil, tag: nil, errors: [message] }
  end
  
  
end