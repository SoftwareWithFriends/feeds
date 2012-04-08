class Post
  include Mongoid::Document
  scope :for_subscription, lambda { |sub_id| sub_id ? where(subscription_id: sub_id) : scoped }

  field :title, :type => String
  field :body, :type => String 
  field :author, :type => String
  field :post_identifier, :type => String
  field :updated_at, :type => DateTime
  field :published_at, :type => DateTime
  field :summary, :type => String
  field :url, :type => String
  belongs_to :subscription
  has_and_belongs_to_many :topics, :inverse_of => nil
  
end
