require_relative '../spec_helper'

describe "navigating the site", :js => true do

  it "should show the name of the app" do
    VCR.use_cassette('feeds_spec') do
      visit "/"
      page.should have_content("Feeds")
      fill_in "subscription_url", :with => "http://ambitiousapathy.com/feed"
      expect {
        click_on "Add"
      }.to change(Post, :count).by(3)
    end
  end
  
  it "should not create a new subscription" do
    VCR.use_cassette('feeds_spec') do
      visit "/"
      fill_in "subscription_url", :with => "http://ambitiousapathy.com/feed"
      expect {
        click_on "Add"
      }.to change(Subscription, :count).by(1)
      fill_in "subscription_url", :with => "http://ambitiousapathy.com/feed"
      expect {
        click_on "Add"
      }.to change(Subscription, :count).by(0)
    end
  end
  
end
