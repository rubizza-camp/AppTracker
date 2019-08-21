require 'rails_helper'
require './lib/services/target_apps'

RSpec.describe Services::TargetApps do
  before(:each) do
    subject.add(app_name)
  end

  subject { Services::TargetApps }

  let(:app_name) { 'testapp' }

  describe "#add" do
    it 'creates new app' do
      expect{ subject.add(app_name) }.to change{ subject.list.size }.by(1)
    end
  end

  describe '#list' do
    it 'returns list of target apps' do
      expect(subject.list).to be_kind_of(ActiveRecord::Relation)
    end
  end

  describe '#remove' do
    it 'deletes app from list' do
      expect{ subject.remove(app_name) }.to change{ subject.list.size }.by(-1)
    end
  end
end
