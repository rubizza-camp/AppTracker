require 'rails_helper'

RSpec.describe Subs, type: :model do
  describe 'associations' do
    it { should belong_to(:app).class_name('App') }
    it { should belong_to(:user).class_name('User') }
  end
end
