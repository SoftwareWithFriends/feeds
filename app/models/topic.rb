class Topic
  include Mongoid::Document
  
  field :name
  has_and_belongs_to_many :subscriptions
  has_and_belongs_to_many :posts
  
end