require 'spec_helper'

describe "songs/show.html.erb" do
  before(:each) do
    @song = assign(:song, stub_model(Song,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
