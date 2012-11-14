class Task < ActiveRecord::Base
	attr_accessible :name, :earned, :total, :due
	belongs_to	:course
	has_many		:grades
	has_many		:students, :through => :grade
end
