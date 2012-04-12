class SubscriptionsController < ApplicationController
  rescue_from Feeds::InvalidFeed, :with => :handle_invalid_feed 

  def create
    SubscriptionManager.from_url(params[:subscription][:url]).update!
    redirect_to root_url
  end

  def index
    @subscriptions = Subscription.all.order("name")
  end

  def show
    @subscription = Subscription.find(params[:id])
    @posts = @subscription.posts.desc(:published_at)
  end

  private
  def handle_invalid_feed
    flash[:alert] = "That is not a valid RSS/ATOM feed."
    redirect_to root_url
  end
end
