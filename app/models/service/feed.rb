require 'ostruct'

module Service
  module Feed
    def self.get_posts_for(url)  
      feed = Feeds::Reader.new(url).content
      OpenStruct.new(posts: Feeds::Posts.new(feed.entries).to_collection_hashes,
                     title: feed.title)
    end 
  end
end
  
