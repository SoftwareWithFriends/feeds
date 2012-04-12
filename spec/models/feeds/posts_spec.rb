require_relative '../../spec_helper'

describe Feeds::Posts do
  describe "with normal entries coming in from feed" do
    let(:now) { Time.now }
    let(:mock_entries) { [double("post_1", :title => "The title", :content => "the body", :author => "Pete Zimbelman", :id => "id1", 
                                           :published => now - 1.day, :updated => now, :url => "thelink1", :summary => "descrip", 
                                           :categories => []), 
                         double("post_2", :title => "The second title", :content => "the second body", :author => "Mclovin", :id => "id2", 
                                          :published => now - 2.days, :updated => now + 1.hour, :url => "thelink2", :summary => "descrip2",
                                          :categories => [] )]}

    let(:expected_collection) { [{:title => "The title", :body => "the body", :author => "Pete Zimbelman", :post_identifier => "id1",
                                  :published_at => now - 1.day, :updated_at => now, :url => "thelink1", :summary => "descrip", 
                                  :topic_ids => []}, 
                                 {:title => "The second title", :body => "the second body", :author => "Mclovin", :post_identifier => "id2", 
                                  :published_at => now - 2.days, :updated_at => now + 1.hour, :url => "thelink2", :summary => "descrip2", 
                                  :topic_ids => []}] }

    it "should convert feed entries to be a collections hash prep'd for mongo" do
      posts_presenter = Feeds::Posts.new(mock_entries)
      posts_presenter.to_collection_hashes.should == expected_collection
    end
  end

  describe "a post with no updated or published date supplied" do
    let(:mock_entries) { [double("post_1", :title => "The title", :content => "the body", :author => "Pete Zimbelman", :id => "id1", 
                                           :updated => nil, :published => nil, :url => "thelink1", :summary => "descrip", :categories => [])] }
    let!(:now) { Time.now }
    before do
      Time.stub(:now).and_return(now)
    end

    it "should use the current time instead of the supplied time" do
      hash = Feeds::Posts.new(mock_entries).to_collection_hashes.first
      hash[:updated_at].should == now
      hash[:published_at].should == now
    end
  end

  describe "a post with categories" do
    let(:mock_entries) { [double("post_1", :title => "The title", :content => "the body", :author => "Pete Zimbelman", :id => "id1", 
                                           :updated => nil, :published => nil, :url => "thelink1", :summary => "descrip", :categories => ["foo", "bar"])] }
    let(:ids) { ["123", "456"] }
    before do
      TopicManager.should_receive(:ids_from_names).with(["foo", "bar"]).and_return(ids)
    end

    it "should use the current time instead of the supplied time" do
      hash = Feeds::Posts.new(mock_entries).to_collection_hashes.first
      hash[:topic_ids].should == ids
    end
  end
end
