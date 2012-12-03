require 'spec_helper'

describe "tempups/show" do
  before(:each) do
    @tempup = assign(:tempup, stub_model(Tempup,
      :upname => "Upname"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Upname/)
  end
end
