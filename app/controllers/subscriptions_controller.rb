class SubscriptionsController < ApplicationController

  def create
    subscription = Service::Subscription.create_subscription(params[:subscription][:url])
    redirect_to root_url
  end
end
