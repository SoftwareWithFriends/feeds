require_relative '../spec_helper'

describe Post, :vcr, :js => true do
  let!(:user) { User.create! email: "admin@email.com", password: "password" }

  it "should allow user to save a post" do
    visit '/'
    click_on "Sign in or Register"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password"
    click_button "Sign in"
    fill_in "subscription_url", :with => "http://feeds-test.herokuapp.com/feed"
    expect {
      click_on "Add"
    }.to change(Post, :count).by(3)
    page.should have_css(".post_row", :count => 3)
    click_on "Testing feeds"

    click_on "save_post"
    page.should have_content("Post saved")

    click_on "Account"
    click_on "Saved Posts"
    page.should have_css(".post_row", :count => 1)
  end

end
