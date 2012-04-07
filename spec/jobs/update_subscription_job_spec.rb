require_relative '../spec_helper'

describe UpdateSubscriptionJob do
  let(:url) { "http://mywebsite.com/feed" }
  let(:mock_manager) { double("mock_manager") }
  before do
    mock_manager.should_receive(:update!)
    SubscriptionManager.stub(:from_url).with(url).and_return(mock_manager)
  end

  it "should create a manager and update feed for the specified url" do
    UpdateSubscriptionJob.new(url).perform
  end
end
