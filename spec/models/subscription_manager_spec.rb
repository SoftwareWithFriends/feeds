require_relative '../spec_helper'

describe SubscriptionManager do
  let(:url) { "http://mywebsite.com/feed" }
  let(:mock_subscription) { double("sub1", url: url, posts: mock_old_posts, id: 1) } 
  let(:mock_old_posts)        { [double("post1", identifier: 1)]}
  let(:mock_new_posts)    { [{id: 2}] } 
  let(:mock_posts)    { mock_new_posts + [{id: 1}]}
  let(:mock_feed) { double("feed", posts: mock_posts, title: "Blog Name") }
  
  describe "when creating a new manager" do
    let(:manager) { SubscriptionManager.from_url(url) }
    before do
      Service::Feed.should_receive(:get_posts_for).with(url).and_return(mock_feed)
      Subscription.stub(:find_or_create_by).with(url: url).and_return(mock_subscription) 
    end

    it "should have a subscription" do
      manager.subscription.should == mock_subscription
    end

    describe "when fetching posts from the feed service" do

      it "should know which posts are new" do
        manager.new_posts.should == mock_new_posts
      end

      it "should update the subscription with the new posts" do
        mock_subscription.should_receive(:add_posts).with(mock_new_posts)
        mock_subscription.should_receive(:update_attributes).with(name: "Blog Name")
        manager.update!
      end
    end
  end
end
