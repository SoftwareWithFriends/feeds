module Service
  module Subscription
  
  def self.create_subscription(url)
    subscription = ::Subscription.find_or_create_by(url: url)
    subscription.add_posts updated_posts(subscription)
  end
  
  def self.update_subscriptions(subscriptions)
    subscriptions.each do |subscription|
      subscription.add_posts updated_posts(subscription)
    end
  end
  
  def self.updated_posts(subscription)
    posts = Feed.get_posts_for(subscription)
    filter_old_posts_for(subscription, posts)
  end
  
  private
  
  def self.filter_old_posts_for(subscription, posts)
    post_ids = subscription.posts.map(&:identifier)
    posts.reject {|post| post_ids.include? post[:id] }
  end
    
  
  end
end