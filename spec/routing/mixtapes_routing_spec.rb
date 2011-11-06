require "spec_helper"

describe MixtapesController do
  describe "routing" do

    it "routes to #index" do
      get("/mixtapes").should route_to("mixtapes#index")
    end

    it "routes to #new" do
      get("/mixtapes/new").should route_to("mixtapes#new")
    end

    it "routes to #show" do
      get("/mixtapes/1").should route_to("mixtapes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mixtapes/1/edit").should route_to("mixtapes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mixtapes").should route_to("mixtapes#create")
    end

    it "routes to #update" do
      put("/mixtapes/1").should route_to("mixtapes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mixtapes/1").should route_to("mixtapes#destroy", :id => "1")
    end

  end
end
