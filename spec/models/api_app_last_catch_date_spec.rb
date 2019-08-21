require 'rails_helper'

RSpec.describe ApiAppLastCatchDate, type: :model do
  it "is valid with valid attributes" do
    expect(ApiAppLastCatchDate.new).to be_valid
  end
end
