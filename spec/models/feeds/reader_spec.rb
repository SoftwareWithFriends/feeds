require_relative '../../spec_helper'

describe Feeds::Reader do
  let(:url) { "http://blog.com/feed" }
  it "should use feed normalizer to fetch feed data" do
    reader = Feeds::Reader.new(url)
    reader.should_receive(:open).with(url).and_return("my content")
    FeedNormalizer::FeedNormalizer.should_receive(:parse).with("my content").and_return("feed data")
    reader.content.should == "feed data"
  end
end
