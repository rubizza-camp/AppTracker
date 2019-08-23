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
      expect(parsed_body['data'].first['attributes']['title']).to eq('test_app')
    end
  end

  describe "GET show" do
    it "returns app data hash" do
      get :show, params: { title: 'test_app' }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['data']['attributes']['Title']).to eq('test_app')
    end

    it "renders empty json if app is not found" do
      get :show, params: { title: '' }
      expect(response.body).to eq('{}')
    end
  end
end
