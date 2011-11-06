require 'spec_helper'

describe "mixtapes/index.html.erb" do
  before(:each) do
    assign(:mixtapes, [
      stub_model(Mixtape,
        :name => "Name"
      ),
      stub_model(Mixtape,
        :name => "Name"
      )
    ])
  end

  it "renders a list of mixtapes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
