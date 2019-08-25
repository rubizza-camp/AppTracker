require 'rails_helper'
require './lib/services/app_id_loader'

RSpec.describe AppIdLoader do
  before(:context) do
    ApiToken.create(value: 'token', credits: 100)
  end

  let(:app_name) { 'testapp' }

  describe '#app_id' do
    it 'returns app id from play market and app store in hash' do
      expect(AppIdLoader.app_id(app_name)).to be_instance_of(Hash)
    end
  end
end
