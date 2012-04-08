require_relative '../spec_helper'

describe Post do
  it { should belong_to(:subscription) }

  describe "a post that only has the summary set" do
    let(:post) { Post.new(summary: "foo") }
    it "should return summary as the post content" do
      post.content.should == "foo"
    end
  end
  
  describe "a post that has the body and summary set" do
    let(:post) { Post.new(body: "blah", summary: "foo") }
    it "should return body as the post content" do
      post.content.should == "blah"
    end
  end

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
