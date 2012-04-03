class Subscription
  include Mongoid::Document

  field :url, :type => String
  has_many :posts, :dependent => :destroy

  after_create :fetch_posts

  def url_base
    URI::parse(url).host
  end

  private
  def fetch_posts
    posts = Feeds::Posts.new(Feeds::Reader.new(url).content.entries).to_collection_hashes
    posts.map! { |post| post.merge(:subscription_id => self.id) }
    Post.collection.insert(posts)
  end
end
