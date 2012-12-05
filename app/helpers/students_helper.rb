module StudentsHelper
	
	def calc_homeworks(student_id)
		@h_total = 0
		@h_earned = 0
		hHash = Hash.new()
		hLegend = []
			
		# Calls helper function for generating modal popup id's
		data = generate_upper_modal_div("homework")

		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id_and_category_id(grade.task_id, 1).each do |homework|
					@h_total += homework.total
					@h_earned += grade.earned
					hLegend << generate_legend(homework, grade)
					# Stores values into a hash
					# Keys = homework name
					# Values = grade percentage
					hHash[homework.name] = calc_percentage(grade.earned, homework.total)
			end
		end
						
		if(!hHash.empty?)
			# Generates total field data
			hHash["Total"] = calc_percentage(@h_earned, @h_total)
			hLegend << "Homework Total - #{calc_percentage(@h_earned, @h_total)}% (#{@h_earned}/#{@h_total})"
			
			# Sort hash alphabetically
			hHash.keys.sort
			
			# Generate google chart if homework exists and create image link
			data += generate_lower_modal_div(generate_chart(hHash, hLegend))
			data += "Total #{calc_percentage(@h_earned, @h_total)}% (#{@h_earned}/#{@h_total})</td>"
		else
			data +="</td>"
		end
		data.html_safe
		
		# Store variables into session
		#session[:hearned] = @h_earned
		#session[:htotal] = @h_total
	end

	def calc_labs(student_id)
		@l_total = 0
		@l_earned = 0
		
		lName = []
		lGrade = []
		lLegend = []
		
		data ="<td><div id='lab' class='modal hide fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>"
		data += "<div class='modal-header'><h3 id='labLabel'> Lab Breakdown</h3></div>"
		data += "<div class='modal-body'><p>"
		Grade.find_all_by_student_id(student_id).each do |grade|
			Task.find_all_by_id_and_category_id(grade.task_id, 2).each do |lab|
					@l_total += lab.total
					@l_earned += grade.earned
					lName << lab.name
					# Calls helper functions
					lGrade << calc_percentage(grade.earned, lab.total)
					lLegend << generate_legend(lab, grade)
			end
		end

		if(@l_total != 0)
			# Generates total field data
			lGrade << calc_percentage(@h_earned, @h_total)
			lName << "Total"
			lLegend << "Lab Total - #{calc_percentage(@l_earned, @l_total)}% (#{@l_earned}/#{@l_total})"
			
			# Generate graph if lab exists...
			@graph = Gchart.bar(:size => '400x200',
												:bar_colors => '76A4FB',
												:background => 'EEEEEE',
												:data => lGrade, 
												:axis_with_labels => ['x', 'y'],
												:axis_labels => [lName],
												:legend => lLegend,	
												:bar_width_and_spacing => '40,30',
												:bg => {:color => 'FFFFFF', :type => 'solid'}, 
												:encoding => 'text')
			# Create an image link
			data += "</br><img src=#{@graph}/></br>"
			data += "</p></div></div>"
			data += "Total #{calc_percentage(@l_earned, @l_total)}% (#{@l_earned}/#{@l_total})</td>"
		else
			data +="</td>"
		end
		data.html_safe
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
		#@c_total = calc_percentage(session[:hearned], session[:htotal])
		
		if(@c_total != 0)
			raw("<td> #{@c_total}<td>" ) 
		else
			raw("<td>N/A</td>")
		end
		#raw("#{session[:hearned]}")
	end
	
	# Helper functions
	def calc_percentage(earned, total)
		return ((earned.to_f/total.to_f)*100).round
	end
	
	def generate_legend(homework, grade)
		return "#{homework.name} - #{calc_percentage(grade.earned, homework.total)}% (#{grade.earned}/#{homework.total})"
	end
	
	def generate_chart(hash, legend)
		return	Gchart.bar(:size => '400x200',
											 :bar_colors => '76A4FB',
											 :background => 'EEEEEE',
											 :data => hash.values, 
											 :axis_with_labels => ['x', 'y'],
											 :axis_labels => [hash.keys],
											 :legend => legend,	
											 :bar_width_and_spacing => '40,30',
											 :bg => {:color => 'FFFFFF', :type => 'solid'}, 
											 :encoding => 'text')
	end
	
	def generate_upper_modal_div(name)
		data = "<td><div id='#{name}' class='modal hide fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>"
		data += "<div class='modal-header'><h3 id='#{name}Label'> #{name.capitalize} Breakdown</h3></div>"
		data += "<div class='modal-body'><p>"
		
		return data
	end
	
	def generate_lower_modal_div(graph)
		data = "</br><img src=#{graph}/></br>"
		data += "</p></div></div>"
		
		return data
	end
	
	
end
