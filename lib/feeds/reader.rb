
module Feeds
  class Reader
    def initialize(url)
      @url = url
    end

    def content
      result = Feedzirra::Feed.easy_fetch_and_parse @url
      raise InvalidFeed if invalid?(result)
      result
    end

    private
    def invalid?(feed_content)
      feed_content.nil? || feed_content == 0
    end
  end
end
