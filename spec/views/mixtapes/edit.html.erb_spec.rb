require 'spec_helper'

describe "mixtapes/edit.html.erb" do
  before(:each) do
    @mixtape = assign(:mixtape, stub_model(Mixtape,
      :name => "MyString"
    ))
  end

  it "renders the edit mixtape form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mixtapes_path(@mixtape), :method => "post" do
      assert_select "input#mixtape_name", :name => "mixtape[name]"
    end
  end
end
