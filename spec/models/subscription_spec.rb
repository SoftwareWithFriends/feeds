require_relative '../spec_helper'

describe Subscription do
  it { should have_many(:posts).with_dependent(:destroy) }
end
