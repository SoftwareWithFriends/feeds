require_relative '../spec_helper'

describe "navigating the site" do

  it "should show the name of the app" do
    visit "/"
    page.should have_content("Feeds")

    fill_in "subscription_url", :with => "foobar.com"

    expect {
      click_on "Add Feed"
    }.to change(Subscription, :count).by(1)    
  end
end
