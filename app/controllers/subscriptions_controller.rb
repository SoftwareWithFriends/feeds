class SubscriptionsController < ApplicationController

  def create
    Service::SubscriptionManager.new(params[:subscription][:url]).update!
    redirect_to root_url
  end
end
