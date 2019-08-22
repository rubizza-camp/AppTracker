require 'rails_helper'

RSpec.describe Keyword, type: :model do
  describe 'associations' do
    # it { should have_many(:apps).through(:apps_keywords) }
    # it { should have_many(:apps_keywords).dependent(:destroy).class_name('AppsKeywords') }
    # doesn't work because of this issue https://github.com/thoughtbot/shoulda-matchers/issues/1044
  end
end
