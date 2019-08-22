require 'rails_helper'

RSpec.describe SimilarApp, type: :model do
  describe 'associations' do
    it { should belong_to(:app).class_name('App') }
  end
end
