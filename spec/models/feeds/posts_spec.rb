require_relative '../../spec_helper'

describe Feeds::Posts do
  let(:now) { Time.now }
  let(:mock_entries) { [double("post_1", :title => "The title", :content => "the body", :author => "Pete Zimbelman", :id => "id1", 
                                         :published => now - 1.day, :updated => now, :url => "thelink1", :summary => "descrip"), 
                       double("post_2", :title => "The second title", :content => "the second body", :author => "Mclovin", :id => "id2", 
                                        :published => now - 2.days, :updated => now + 1.hour, :url => "thelink2", :summary => "descrip2" )]}

  let(:expected_collection) { [{:title => "The title", :body => "the body", :author => "Pete Zimbelman", :post_identifier => "id1",
                                :published_at => now - 1.day, :updated_at => now, :url => "thelink1", :summary => "descrip"}, 
                               {:title => "The second title", :body => "the second body", :author => "Mclovin", :post_identifier => "id2", 
                                :published_at => now - 2.days, :updated_at => now + 1.hour, :url => "thelink2", :summary => "descrip2"}] }

  it "should convert feed entries to be a collections hash prep'd for mongo" do
    posts_presenter = Feeds::Posts.new(mock_entries)
    posts_presenter.to_collection_hashes.should == expected_collection
  end
end
