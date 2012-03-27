class SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.create!(params[:subscription])
    redirect_to root_url
  end
end
