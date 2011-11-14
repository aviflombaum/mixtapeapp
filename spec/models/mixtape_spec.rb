require 'spec_helper'

describe Mixtape do

  it "is valid with valid attributes" do
    Mixtape.new(:name => "My Favorite Playlist").should be_valid
  end
  
  it "is not valid without a name" do
    mixtape = Mixtape.new :name => nil
    mixtape.should_not be_valid
  end
  
end