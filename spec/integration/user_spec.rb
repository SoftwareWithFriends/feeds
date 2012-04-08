require_relative '../spec_helper'

describe "with a user that exists" do
  let!(:user) { User.create! email: "admin@email.com", password: "password" }

  it "should allow a user to sign in and sign out" do
    visit "/"
    click_on "Sign in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully")
    click_on "Sign out"
    page.should have_content("Signed out successfully")
  end
end
