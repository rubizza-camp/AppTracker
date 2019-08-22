require 'rails_helper'

RSpec.describe AppsKeywords, type: :model do
  describe 'associations' do
    it { should belong_to(:app).class_name('App') }
    it { should belong_to(:keyword).class_name('Keyword') }
  end
end
