require 'rails_helper'
require './app/controllers/api/v1/apps_controller'

describe "main page route" do
  it "routes to index" do
    expect( get: "/api/v1/apps" ).
        to route_to(controller: "api/v1/apps", action: "index")
  end
end

describe "app route" do
  it "routes to app page" do
    expect( get: "/api/v1/apps/title" ).
        to route_to(controller: "api/v1/apps", action: "show", title: "title")
  end
end
