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
    
  describe "when trying to look up topics from a set of names" do
    let(:first_topic) { double("topic1", id: "abc") }
    let(:second_topic) { double("topic2", id: "def") }
    let(:mock_topics) {[first_topic, second_topic] }
    before do
      Topic.stub(:find_or_create_by).and_return(first_topic, second_topic)
    end

    it "should return a list of topics" do
      TopicManager.ids_from_names(["blah1", "blah2"]).should == ["abc", "def"]
    end
  end
end
