require 'spec_helper'

describe "tempups/edit" do
  before(:each) do
    @tempup = assign(:tempup, stub_model(Tempup,
      :upname => "MyString"
    ))
  end

  it "renders the edit tempup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tempups_path(@tempup), :method => "post" do
      assert_select "input#tempup_upname", :name => "tempup[upname]"
    end
  end
end
