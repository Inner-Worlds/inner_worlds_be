class TagFacade

  def initialize(payload)
    @payload = payload
  end

  def generate_tags
    TopicService.new(payload).get_topics
  end
end