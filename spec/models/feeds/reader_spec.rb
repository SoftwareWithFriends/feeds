require_relative '../../spec_helper'

describe Feeds::Reader do
  let(:url) { "http://blog.com/feed" }
  describe "with a valid feed that returns data" do
    before do
      Feedzirra::Feed.should_receive(:fetch_and_parse).with(url).and_return("feed data")
    end

    it "should use feed normalizer to fetch feed data" do
      reader = Feeds::Reader.new(url)
      reader.content.should == "feed data"
    end
  end

  describe "with an invalid feed that returns nil from Feedzirra" do
    before do
      Feedzirra::Feed.should_receive(:fetch_and_parse).with(url).and_return(nil)
    end

    it "should use feed normalizer to fetch feed data" do
      reader = Feeds::Reader.new(url)
      lambda { reader.content }.should raise_error(Feeds::InvalidFeed)
    end
  end

  describe "with an invalid url that returns 0 from Feedzirra" do
    before do
      Feedzirra::Feed.should_receive(:fetch_and_parse).with(url).and_return(0)
    end

    it "should use feed normalizer to fetch feed data" do
      reader = Feeds::Reader.new(url)
      lambda { reader.content }.should raise_error(Feeds::InvalidFeed)
    end
  end
end
