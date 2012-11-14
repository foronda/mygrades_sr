class Student < ActiveRecord::Base
	belongs_to	:course
	has_many		:grade
	has_many		:tasks, :through => :grade
end
