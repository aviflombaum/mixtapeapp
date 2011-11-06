require 'spec_helper'

describe "Mixtapes" do
  describe "GET /mixtapes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mixtapes_path
      response.status.should be(200)
    end
  end
end
