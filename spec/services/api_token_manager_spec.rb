require 'rails_helper'
require './lib/services/api_token_manager'

RSpec.describe Services::ApiTokenManager do
  describe "#token_with_credits" do
    let(:minimal_credits) {10}

    it "returns nil if token is nil" do
      expect(Services::ApiTokenManager.token_with_credits(minimal_credits)).to eq(nil)
    end

    it "returns token value" do
      ApiToken.create(id: 0, value: 'ms2TcHIToWpBQ6AsCxGxDxfqGOU', credits: 100)
      expect(Services::ApiTokenManager.token_with_credits(minimal_credits)).to eq('ms2TcHIToWpBQ6AsCxGxDxfqGOU')
    end
  end
end
