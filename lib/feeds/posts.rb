module Feeds
  class Posts
    def initialize(feed_entries)
      @entries = feed_entries
    end

    def to_collection_hashes
      @entries.map { |entry| {:title => entry.title, :body => entry.content, :author => entry.author } }
    end
  end
end
