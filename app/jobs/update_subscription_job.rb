class UpdateSubscriptionJob < Struct.new(:url)
  def perform
    SubscriptionManager.from_url(url).update!
  end
end
