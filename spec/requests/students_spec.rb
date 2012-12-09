require 'spec_helper'
require 'test/unit'
require 'mocha/setup'

describe "Students page" do

	it "should have the content 'Listing students'" do
		visit '/students'
		page.should have_content('Listing students')
	end
	
	it "should have the th 'Course'" do
		visit '/students'
		page.should have_selector('th', :text => 'Course')
	end

	it "should have the th 'Username'" do
		visit '/students'
		page.should have_selector('th', :text => 'Username')
	end
	
	it "should have the th 'Homework'" do
		visit '/students'
		page.should have_selector('th', :text => 'Homework')
	end
	
end
