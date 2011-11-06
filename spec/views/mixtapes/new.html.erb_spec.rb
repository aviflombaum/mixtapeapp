require 'spec_helper'

describe "mixtapes/new.html.erb" do
  before(:each) do
    assign(:mixtape, stub_model(Mixtape,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new mixtape form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mixtapes_path, :method => "post" do
      assert_select "input#mixtape_name", :name => "mixtape[name]"
    end
  end
end
