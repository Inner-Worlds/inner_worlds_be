class TopicService 

  def initialize(payload)
    @payload = payload
  end

  def get_topics
    response = conn.get do |req|
      req.headers["X-RapidAPI-Key"] = ENV["X-RapidAPI-Key"]
      req.headers["X-RapidAPI-Host"] = ENV["X-RapidAPI-Host"]
      req.params["text"] = @payload
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:keyword].keys.first(3) << json[:topic].keys.first #First 3 keys, and first topic from the response
  end


  private

  def conn
    Faraday.new(url: 'https://twinword-topic-tagging.p.rapidapi.com/generate/')
  end
end