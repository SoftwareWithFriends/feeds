require_relative '../spec_helper'

describe Topic do

  it "should select posts by topic" do
    topic = Topic.create name: "topic1"
    subscription = Subscription.create!
    subscription.topics << topic
    
    found_subscription = topic.subscriptions.first
    
    found_subscription.should == subscription
  end

end
