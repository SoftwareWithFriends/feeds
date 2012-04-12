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

  def self.ids_from_names(names)
    names.map do |name|
      Topic.find_or_create_by(name: name).id
    end
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
