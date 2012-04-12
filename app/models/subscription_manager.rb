class SubscriptionManager
  attr_reader :subscription
  
  def self.from_url(url)
    feed = Service::Feed.get_posts_for(url)
    new(Subscription.find_or_create_by(url: url), feed)
  end
  
  def initialize(subscription, feed)
    @subscription = subscription
    @feed = feed
  end  
  
  def new_posts
    filter_old_posts_for(subscription, @feed.posts)
  end

  def update!
    subscription.update_attributes(name: @feed.title)
    subscription.add_posts new_posts
  end
  
  private
  
  def filter_old_posts_for(subscription, posts)
    post_ids = subscription.posts.map(&:identifier)
    posts.reject {|post| post_ids.include? post[:id] }
  end
end

