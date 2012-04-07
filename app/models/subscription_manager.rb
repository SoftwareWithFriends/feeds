class SubscriptionManager
  attr_reader :subscription
  
  def self.from_url(url)
    new(Subscription.find_or_create_by(url: url))
  end
  
  def initialize(subscription)
    @subscription = subscription
  end  
  
  def new_posts
    filter_old_posts_for(subscription, feed.posts)
  end

  def update!
    subscription.update_attributes(name: feed.title)
    subscription.add_posts new_posts
  end
  
  private

  def feed
    @feed ||= Service::Feed.get_posts_for(subscription)
  end
  
  def filter_old_posts_for(subscription, posts)
    post_ids = subscription.posts.map(&:identifier)
    posts.reject {|post| post_ids.include? post[:id] }
  end
end

