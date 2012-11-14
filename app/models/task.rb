class Task < ActiveRecord::Base
	belongs_to	:course
	has_many		:grade
	has_many		:students, through => :grade
end
