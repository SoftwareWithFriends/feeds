require_relative '../../spec_helper'

describe Feeds::Reader do
  let(:entries) { [double("post_1", :title => "The title", :content => "the body"), 
                   double("post_2", :title => "The second title", :content => "the second body")] }
  let(:expected_collection) { [{:title => "The title", :body => "the body"}, {:title => "The second title", :body => "the second body"}] }
  it "should convert feed entries to be a collections hash prep'd for mongo" do
    posts_presenter = Feeds::Posts.new(entries)
    posts_presenter.to_collection_hashes.should == expected_collection
  end
end
