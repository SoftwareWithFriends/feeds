class TopicManager
  
  attr_reader :topic, :found
  
  def self.from_name(name)
    topic = Topic.where(name: name).first
    found = true
    unless topic
      topic = Topic.create(name: name)
      found = false
    end
    new(topic, found)
  end
  
  def initialize(topic, found)
    @topic = topic
    @found = found
  end
  
  def update_post(post)
    return false if post.has_topic? topic
    post.topics << topic
    return true
  end
  
end