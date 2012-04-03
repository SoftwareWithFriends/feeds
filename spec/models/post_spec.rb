require_relative '../spec_helper'

describe Post do
  it { should belong_to(:subscription) }
end
