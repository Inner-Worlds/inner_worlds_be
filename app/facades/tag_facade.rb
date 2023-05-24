class TagFacade

  def initialize(dream, user_made_tags)
    @dream = dream
    @user_made_tags = user_made_tags
  end

  def generate_tags
    api_tags = TopicService.new(@dream.description).get_topics
    all_tags = @user_made_tags + api_tags
    all_tags = all_tags.map do |tag|
      tag.downcase.to_sym
    end
    generate_dreamtags(all_tags)
  end
end



private 

def generate_dreamtags(tags)
  tags.map do |name| 
    new_tag = Tag.find_or_create_by(name: name)
    DreamTag.create!(dream_id: @dream.id, tag_id: new_tag.id)
  end
end
