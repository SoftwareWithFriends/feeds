require_relative '../spec_helper'

describe Post do
  it { should belong_to(:subscription) }
  
  it "should have topic" do
    topic = Topic.create name: "topic name"
    post = Post.create
    post.topics << topic
    post.has_topic?(topic).should == true
  end
  
  it "should not have topic" do
    topic = Topic.create name: "topic name"
    post = Post.create
    post.has_topic?(topic).should == false
  end
end
