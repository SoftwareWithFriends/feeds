class UpdateSubscriptionJob < Struct.new(:url)
  def perform
    Service::SubscriptionManager.new(url).update!
  end
end
