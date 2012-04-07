class SubscriptionsController < ApplicationController

  def create
    SubscriptionManager.from_url(params[:subscription][:url]).update!
    redirect_to root_url
  end

  def index
    @subscriptions = Subscription.all.order("name")
  end
end
