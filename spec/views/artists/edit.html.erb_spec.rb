require 'spec_helper'

describe "artists/edit.html.erb" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist,
      :name => "MyString"
    ))
  end

  it "renders the edit artist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artists_path(@artist), :method => "post" do
      assert_select "input#artist_name", :name => "artist[name]"
    end
  end
end
