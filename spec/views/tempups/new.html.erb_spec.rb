require 'spec_helper'

describe "tempups/new" do
  before(:each) do
    assign(:tempup, stub_model(Tempup,
      :upname => "MyString"
    ).as_new_record)
  end

  it "renders new tempup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tempups_path, :method => "post" do
      assert_select "input#tempup_upname", :name => "tempup[upname]"
    end
  end
end
