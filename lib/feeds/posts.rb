module Feeds
  class Posts
    def initialize(feed_entries)
      @entries = feed_entries
    end

    def to_collection_hashes
      @entries.map { |entry| {:title => entry.title, :body => entry.content, 
                            :author => entry.author, :post_identifier => entry.id,
                            :published_at => now_if_nil_for(entry.published), 
                            :updated_at => now_if_nil_for(entry.updated), 
                            :url => entry.url, :summary => entry.summary }}
    end

    private
    def now_if_nil_for(datetime)
      datetime ? datetime : Time.now
    end
  end
end
