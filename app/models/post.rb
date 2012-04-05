class Post
  include Mongoid::Document

  field :title, :type => String
  field :body, :type => String 
  field :author, :type => String
  field :post_identifier, :type => String
  field :updated_at, :type => DateTime
  belongs_to :subscription
end
