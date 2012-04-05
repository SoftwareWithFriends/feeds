require_relative '../../spec_helper'

describe Feeds::Reader do
  let(:now) { Time.now }
  let(:mock_entries) { [double("post_1", :title => "The title", :content => "the body", :author => "Pete Zimbelman", :id => "id1", :updated => now), 
                       double("post_2", :title => "The second title", :content => "the second body", :author => "Mclovin", :id => "id2", :updated => now + 1.hour )]}
  let(:expected_collection) { [{:title => "The title", :body => "the body", :author => "Pete Zimbelman", :post_identifier => "id1", :updated_at => now}, 
                               {:title => "The second title", :body => "the second body", :author => "Mclovin", :post_identifier => "id2", :updated_at => now + 1.hour}] }

  it "should convert feed entries to be a collections hash prep'd for mongo" do
    posts_presenter = Feeds::Posts.new(mock_entries)
    posts_presenter.to_collection_hashes.should == expected_collection
  end
end
