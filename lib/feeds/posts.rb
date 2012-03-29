module Feeds
  class Posts
    def initialize(feed_entries)
      @entries = feed_entries
    end

    def to_collection_hashes
      @entries.map { |entry| {:title => entry.title, :body => entry.content, :author => entry.authors.first.gsub("\n", "") } }
    end
  end
end
