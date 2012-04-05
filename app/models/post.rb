class Post
  include Mongoid::Document

  field :title, :type => String
  field :body, :type => String 
  field :author, :type => String
  belongs_to :subscription
  has_and_belongs_to_many :topics, :inverse_of => nil
  
end
