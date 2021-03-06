class Subscription
  include Mongoid::Document

  field :url, :type => String
  field :name, :type => String
  has_many :posts, :dependent => :destroy
  has_and_belongs_to_many :topics

  def url_base
    URI::parse(url).host
  end
  
  def add_posts(post_hashes)
    post_hashes.map! {|post| post.merge({subscription_id: id})}
    post_hashes.each do |hash| 
      Post.create!(hash)
    end
  end

  def self.enqueue_all_update_jobs
    all.each do |subscription|
      Delayed::Job.enqueue UpdateSubscriptionJob.new(subscription.url)
    end
  end
end
