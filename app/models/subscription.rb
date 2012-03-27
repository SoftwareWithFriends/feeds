class Subscription
  include Mongoid::Document

  field :url, :type => String
  embeds_many :posts

  after_create :fetch_posts


  private
  def fetch_posts
    posts = Feeds::Posts.new(Feeds::Reader.new(url).content.entries).to_collection_hashes
    Post.collection.insert(posts)
  end
end
