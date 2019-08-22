require 'rails_helper'
require './app/controllers/api/v1/apps_controller'

RSpec.describe Api::V1::AppsController, type: :controller do
  before(:context) do
    App.create(title: 'test_app')
  end

  describe "GET index" do
    it "returns apps titles in json" do
      get :index
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.first['title']).to eq('test_app')
    end
  end

  describe "GET show" do
    it "returns app hash with 16 keys" do
      get :show, params: { title: 'test_app' }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.keys.size).to eq(16)
    end

    it "returns app hash" do
      get :show, params: { title: 'test_app' }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['title']).to eq('test_app')
    end
  end
end
