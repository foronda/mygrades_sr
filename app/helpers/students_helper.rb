module StudentsHelper
	def calc_homeworks(student_id)
		@h_total = 0
		@h_earned = 0
		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id_and_category_id(grade.task_id, 1).each do |homework|
					@h_total += homework.total
					@h_earned += grade.earned
			end
		end
		session[:h_earned] = @h_earneds
		
		if(@h_total != 0)
			raw("<td> #{((@h_earned.to_f/@h_total.to_f)*100).round}% (#{@h_earned}/#{@h_total})</td>" ) 
		else
			raw("<td>N/A</td>")
		end
	end
	
	def calc_labs(student_id)
		@l_total = 0
		@l_earned = 0
		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id_and_category_id(grade.task_id, 2).each do |lab|
					@l_total += lab.total
					@l_earned += grade.earned
			end
		end

		if(@l_total != 0)
			raw("<td> #{((@l_earned.to_f/@l_total.to_f)*100).round}% (#{@l_earned}/#{@l_total})</td>" ) 
		else
			raw("<td>N/A</td>")
		end
	end
	
	def calc_midterms(student_id)
		@m_total = 0
		@m_earned = 0
		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id_and_category_id(grade.task_id, 3).each do |midterm|
					@m_total += midterm.total
					@m_earned += grade.earned
			end
		end

		if(@m_total != 0)
			raw("<td> #{((@m_earned.to_f/@m_total.to_f)*100).round}% (#{@m_earned}/#{@m_total})</td>" ) 
		else
			raw("<td>N/A</td>")
		end
	end
	
	def calc_course(student_id)
		@c_total = 0
		@c_earned = 0
		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id(grade.task_id).each do |course|
					@c_total += course.total
					@c_earned += grade.earned
			end
		end
		if(@c_total != 0)
			raw("<td> #{((@c_earned.to_f/@c_total.to_f)*100).round}% (#{@c_earned}/#{@c_total})</td>" ) 
		else
			raw("<td>N/A</td>")
		end
	end
	
	
end
