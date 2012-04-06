module Service
  module Feed
  
    def self.get_posts_for(subscription)  
      url = subscription.url
      Feeds::Posts.new(Feeds::Reader.new(url).content.entries).to_collection_hashes
    end 
  end
end
  