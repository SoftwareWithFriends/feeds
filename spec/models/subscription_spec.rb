require_relative '../spec_helper'

describe Subscription do
  it { should embed_many(:posts) }
end
