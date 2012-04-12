require_relative '../spec_helper'

describe Subscription do
  it { should have_many(:posts).with_dependent(:destroy) }

  describe "with some mock subscriptions" do
    let(:mock_subscriptions) { [double("sub1", url: "url"), double("sub2", url: "url2")] }
    before do
      Subscription.stub(:all).and_return(mock_subscriptions)
    end

    it "should enqueue jobs for each subscription to update the posts" do
      Delayed::Job.should_receive(:enqueue).exactly(2).times
      Subscription.enqueue_all_update_jobs
    end
  end
end
