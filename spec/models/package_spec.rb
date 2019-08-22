require 'rails_helper'

RSpec.describe Package, type: :model do
  it "is valid with valid attributes" do
    expect(Package.new).to be_valid
  end
end
