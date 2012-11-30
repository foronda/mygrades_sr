require 'spec_helper'

describe "Students page" do

	it "should have the content 'Listing students'" do
		visit '/students'
		page.should have_content('Listing students')
	end
	
	it "should have the th 'Course'" do
		visit '/students'
		page.should have_selector('th', :text => 'Course')
	end
	
end
