class SubscriptionsController < ApplicationController

  def create
    SubscriptionManager.from_url(params[:subscription][:url]).update!
    redirect_to root_url
  end
end
