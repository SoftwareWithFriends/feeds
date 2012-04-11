class SubscriptionsController < ApplicationController

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
end
