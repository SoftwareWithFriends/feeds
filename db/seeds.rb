
sub = Subscription.create! :url => "http://myblog.com"

sub.posts << Post.create!(:title => "First Post", :body => "This is the post body")
sub.posts << Post.create!(:title => "Second Post", :body => "This is the post body of the second post")

