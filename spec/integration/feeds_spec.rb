require_relative '../spec_helper'

describe "navigating the site", :js => true do

  it "should show the name of the app" do
    VCR.use_cassette('feeds_spec') do
      visit "/"
      page.should have_content("Feeds")
      fill_in "subscription_url", :with => "http://ambitiousapathy.com/feed"
      page.evaluate_script("document.forms[0].submit()")
      wait_until { Post.count == 3 }
    end
  end
  
end
