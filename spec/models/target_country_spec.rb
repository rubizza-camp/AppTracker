require 'rails_helper'

RSpec.describe TargetCountry, type: :model do
  it "is valid with valid attributes" do
    expect(TargetCountry.new).to be_valid
  end
end
