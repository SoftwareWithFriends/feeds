require_relative '../spec_helper'

describe Topic, :js => true do
  it "should add the topic to the post" do
    post = Post.create summary: "summary", body: "body" 
    p post
    visit post_path(post)
    fill_in "topic_name", :with => "topic name"
    expect {
      click_on "Add Topic"
    }.to change(Topic, :count).by(1)
    post = Post.find post.id
    p post
    post.topics.count.should == 1
    page.should have_css(".btn .topic", :count => 1)
  end

end
