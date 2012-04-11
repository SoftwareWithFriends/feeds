module PostHelper

  def details_link_for(post)
    date = post.published_at.strftime("%m/%d/%Y")
    subscription_link = link_to("(#{post.subscription.url_base})", subscription_path(post.subscription), 
                                :title => "See more posts from this source", :class => "italic")
    "on #{date} from #{subscription_link}".html_safe
  end
end
