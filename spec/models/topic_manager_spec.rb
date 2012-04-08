require_relative '../spec_helper'

describe TopicManager do

  it "should be no found with new topic" do
    manager = TopicManager.from_name("topic name")
    manager.topic.name.should == "topic name"
    manager.found.should == false
  end
  
  it "should be found with existing topic" do
    Topic.create(name: "topic name")
    manager = TopicManager.from_name("topic name")
    manager.topic.name.should == "topic name"
    manager.found.should == true
  end
  
  it "should add topic to post without topic" do
    post = Post.create
    manager = TopicManager.from_name("topic name")  
    manager.update_post(post).should == true
    post.topics.count.should == 1
  end
  
  it "should add topic to post without topic" do
    post = Post.create
    topic = Topic.create name: "topic name"
    post.topics << topic
    manager = TopicManager.from_name("topic name")  
    manager.update_post(post).should == false
    post.topics.count.should == 1
  end
    
end
