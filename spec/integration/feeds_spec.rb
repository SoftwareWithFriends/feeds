require_relative '../spec_helper'

describe "navigating the site" do

  it "should show the name of the app" do
    visit "/"
    page.should have_content("Feeds")
  end
end
