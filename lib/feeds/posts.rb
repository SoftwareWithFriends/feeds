module Feeds
  class Posts
    def initialize(feed_entries)
      @entries = feed_entries
    end

    def to_collection_hashes
      @entries.map do |entry| 
        {:title => entry.title, :body => entry.content, 
        :author => entry.author, :post_identifier => entry.id,
        :published_at => now_if_nil_for(entry.published), 
        :updated_at => now_if_nil_for(entry.updated), 
        :url => entry.url, :summary => entry.summary,
        :topic_ids => TopicManager.ids_from_names(entry.categories) }
      end
    end

    private
    def now_if_nil_for(datetime)
      datetime ? datetime : Time.now
    end
  end
end
