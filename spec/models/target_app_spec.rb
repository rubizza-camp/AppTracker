require 'rails_helper'

RSpec.describe TargetApp, type: :model do
  it "is valid with valid attributes" do
    expect(TargetApp.new).to be_valid
  end
end
