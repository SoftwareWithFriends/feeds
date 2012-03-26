class Subscription
  include Mongoid::Document

  field :url, :type => String
  embeds_many :posts
end
