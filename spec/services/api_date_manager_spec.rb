require 'rails_helper'
require './lib/services/api_date_manager'

RSpec.describe Services::ApiTokenManager do
  before(:each) do
    ApiAppLastCatchDate.create(date: DateTime.now - 1.day, app_id: 1)
  end

  let(:app_id) { 1 }

  describe "#last_date" do
    it "returns date one month back if last date is not found" do
      expect(Services::ApiDateManager.last_date(nil)).to eq((DateTime.now - 1.month).to_date)
    end

    it "returns last date" do
      expect(Services::ApiDateManager.last_date(app_id)).to eq((DateTime.now - 1.day).to_date)
    end
  end

  describe "#update" do
    it "updates date of one app" do
      Services::ApiDateManager.update(app_id)
      expect(ApiAppLastCatchDate.where(app_id: app_id).order(:date).last.date.to_date).to eq(DateTime.now.to_date)
    end
  end

  describe "#update_all" do
    it "updates date of all apps" do
      Services::ApiDateManager.update_all
      expect(ApiAppLastCatchDate.where(app_id: app_id).order(:date).last.date.to_date).to eq(DateTime.now.to_date)
    end
  end
end
