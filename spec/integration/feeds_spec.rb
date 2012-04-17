require_relative '../spec_helper'

describe "navigating the site", :vcr, :js => true do

  it "should allow adding a feed and viewing just that feeds posts" do
    visit "/"
    page.should have_content("Feeds")
    expect {
      fill_in "subscription_url", :with => "http://ambitiousapathy.herokuapp.com/feed"
      click_on "Add"
    }.to change(Post, :count).by(4)

    fill_in "subscription_url", :with => "http://feeds-test.herokuapp.com/feed"
    expect {
      click_on "Add"
    }.to change(Post, :count).by(3)
    page.should have_css(".post_row", :count => 7)

    click_on "All Feeds"
    click_on "Ambitious Apathy"
    page.should have_css(".post_row", :count => 4)
    click_on "Feeds"
    click_on "Testing feeds"
    page.should have_content("Testing feeds")
    page.should_not have_css("#save_post")
  end

  it "should show an error when trying to add an invalid feed" do
    visit "/"
    fill_in "subscription_url", :with => "http://foobar"
    click_on "Add"
    page.should have_content("not a valid RSS/ATOM feed")
  end
  
  it "should not create a new subscription" do
    visit "/"
    fill_in "subscription_url", :with => "http://feeds-test.herokuapp.com/feed"
    expect {
      click_on "Add"
    }.to change(Subscription, :count).by(1)
    fill_in "subscription_url", :with => "http://feeds-test.herokuapp.com/feed"
    expect {
      click_on "Add"
    }.to change(Subscription, :count).by(0)
  end
end
