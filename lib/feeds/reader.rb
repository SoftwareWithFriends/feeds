require 'open-uri'

module Feeds
  class Reader
    def initialize(url)
      @url = url
    end

    def content
      FeedNormalizer::FeedNormalizer.parse open(@url)
    end
  end
end
