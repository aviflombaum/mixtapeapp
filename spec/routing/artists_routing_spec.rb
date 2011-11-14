require "spec_helper"

describe ArtistsController do
  describe "routing" do

    it "routes to #index" do
      get("/artists").should route_to("artists#index")
    end

    it "routes to #new" do
      get("/artists/new").should route_to("artists#new")
    end

    it "routes to #show" do
      get("/artists/1").should route_to("artists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/artists/1/edit").should route_to("artists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/artists").should route_to("artists#create")
    end

    it "routes to #update" do
      put("/artists/1").should route_to("artists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/artists/1").should route_to("artists#destroy", :id => "1")
    end

  end
end
