require_relative '../../spec_helper'

describe Feeds::Reader do
  let(:url) { "http://blog.com/feed" }
  it "should use feed normalizer to fetch feed data" do
    reader = Feeds::Reader.new(url)
    Feedzirra::Feed.should_receive(:fetch_and_parse).with(url).and_return("feed data")
    reader.content.should == "feed data"
  end
end
