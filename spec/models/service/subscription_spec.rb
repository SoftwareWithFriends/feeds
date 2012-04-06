require_relative '../../spec_helper'

describe "subscription service" do
  let(:mock_subscription) { double("sub1", url: "url1", posts: mock_old_posts, id: 1) } 
  let(:mock_old_posts)        { [double("post1", identifier: 1)]}
  let(:mock_new_posts)    { [{id: 2}] } 
  let(:mock_posts)    { mock_new_posts + [{id: 1}]}
  

  describe "when fetching new posts" do
    before do
      Service::Feed.should_receive(:get_posts_for).with(mock_subscription).and_return(mock_posts) 
    end
    
    it "should return new posts based on post identifiers" do  
      Service::Subscription.updated_posts(mock_subscription).should == mock_new_posts
    end
    
    it "should update posts on subscription" do
      mock_subscription.should_receive(:add_posts).with(mock_new_posts)
      Service::Subscription.update_subscriptions([mock_subscription])
    end
  end
end
