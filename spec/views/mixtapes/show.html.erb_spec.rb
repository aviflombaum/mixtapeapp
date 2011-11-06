require 'spec_helper'

describe "mixtapes/show.html.erb" do
  before(:each) do
    @mixtape = assign(:mixtape, stub_model(Mixtape,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
