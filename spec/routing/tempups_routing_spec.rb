require "spec_helper"

describe TempupsController do
  describe "routing" do

    it "routes to #index" do
      get("/tempups").should route_to("tempups#index")
    end

    it "routes to #new" do
      get("/tempups/new").should route_to("tempups#new")
    end

    it "routes to #show" do
      get("/tempups/1").should route_to("tempups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tempups/1/edit").should route_to("tempups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tempups").should route_to("tempups#create")
    end

    it "routes to #update" do
      put("/tempups/1").should route_to("tempups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tempups/1").should route_to("tempups#destroy", :id => "1")
    end

  end
end
