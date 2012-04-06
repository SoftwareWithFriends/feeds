module Service
  class SubscriptionManager
    attr_reader :subscription
    def initialize(url)
      @subscription = Subscription.find_or_create_by(url: url)
    end  
    
    def new_posts
      posts = Feed.get_posts_for(subscription)
      filter_old_posts_for(subscription, posts)
    end

    def update!
      subscription.add_posts new_posts
    end
    
    private
    
    def filter_old_posts_for(subscription, posts)
      post_ids = subscription.posts.map(&:identifier)
      posts.reject {|post| post_ids.include? post[:id] }
    end
  end
end
