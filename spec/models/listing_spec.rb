require 'rails_helper'

describe Listing, "Validation" do
  it { should validate_presence_of(:name) }
end
