module StudentsHelper
	def calc_homeworks(student_id)
		@h_total = 0
		@h_earned = 0
		hName = []
		hGrade = []
		hLegend = []
		@test
		data ="<td><div id='homework' class='modal hide fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>"
		data += "<div class='modal-header'><h3 id='homeworkLabel'> Homework Breakdown</h3></div>"
		data += "<div class='modal-body'><p>"
		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id_and_category_id(grade.task_id, 1).each do |homework|
					@h_total += homework.total
					@h_earned += grade.earned
					hName << homework.name
					hGrade << ((grade.earned.to_f/homework.total.to_f)*100).round
					hLegend << "#{homework.name} (#{@h_earned}/#{@h_total})"
					concat hLegend
					#hEarned << grade.earned
					data += "#{homework.name} - #{grade.earned}/#{homework.total}</br>"
			end
		end
						
		
		if(@h_total != 0)
			hGrade << ((@h_earned.to_f/@h_total.to_f)*100).round
			hName << "Total"
			@graph = Gchart.bar(:data => hGrade, 
												:axis_with_labels => ['x', 'y'],
												:axis_labels => [hName],
												:legend => hLegend,	
												:bar_width_and_spacing => '40,30',
												:bg => {:color => 'FFFFFF', :type => 'solid'}, 
												:bar_colors => 'ff0000,00ff00',
												:encoding => 'text')
												
			data += "</br>Total #{((@h_earned.to_f/@h_total.to_f)*100).round}% (#{@h_earned}/#{@h_total})"
			data += "</br><img width='450' height='450' src=#{@graph}/></br>"
			data += "</p></div></div>"
			data += "Total #{((@h_earned.to_f/@h_total.to_f)*100).round}% (#{@h_earned}/#{@h_total})</td>"
		else
			data +="</td>"
		end
		data.html_safe
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
