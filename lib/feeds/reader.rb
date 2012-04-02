
module Feeds
  class Reader
    def initialize(url)
      @url = url
    end

    def content
      Feedzirra::Feed.fetch_and_parse @url
    end
  end
end
