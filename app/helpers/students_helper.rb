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
                hHash[homework.name] = grade.earned.percent_of(homework.total)
            end
        end
        #concat hHash
        if(!hHash.empty?)
            # Generates total field data
            hHash["Total"] = @h_earned.percent_of(@h_total)
            hLegend << "Homework Total - #{@h_earned.percent_of(@h_total)}% (#{@h_earned}/#{@h_total})"
            
            # Sort hash alphabetically
            hHash.keys.sort
            
            # Generate google chart if homework exists and create image link
            data += generate_lower_modal_div(generate_chart(hHash, hLegend))
            data += "#{@h_earned.percent_of(@h_total)}% (#{@h_earned}/#{@h_total})</td>"
        else
            data +="</td>"
        end
        data.html_safe
    end

    def calc_labs(student_id)
        @l_total = 0
        @l_earned = 0

        lHash = Hash.new()
        lLegend = []

        data = generate_upper_modal_div("lab")
        Grade.find_all_by_student_id(student_id).each do |grade|
            Task.find_all_by_id_and_category_id(grade.task_id, 2).each do |lab|
                    @l_total += lab.total
                    @l_earned += grade.earned

                    lLegend << generate_legend(lab, grade)
                    # Stores values into a hash
                    # Keys = homework name
                    # Values = grade percentage
                    lHash[lab.name] = grade.earned.percent_of(lab.total)
            end
        end
        #concat lHash
        if(!lHash.empty?)
            # Generates total field data
            lHash["Total"] = @h_earned.percent_of(@h_total)
            lLegend << "Lab Total - #{@l_earned.percent_of(@l_total)}% (#{@l_earned}/#{@l_total})"
            
            # Sort hash alphabetically
            lHash.keys.sort
            
            # Generate google chart if homework exists and create image link
            data += generate_lower_modal_div(generate_chart(lHash, lLegend))
            data += "#{@l_earned.percent_of(@l_total)}% (#{@l_earned}/#{@l_total})</td>"
        else
            data +="</td>"
        end
        data.html_safe
    end

    def calc_midterms(student_id)
      @m_total = 0
      @m_earned = 0

      mHash = Hash.new()
      mLegend = []

      data = generate_upper_modal_div("midterm")
      Grade.find_all_by_student_id(student_id).each do |grade|
        Task.find_all_by_id_and_category_id(grade.task_id, 3).each do |midterm|
              @m_total += midterm.total
              @m_earned += grade.earned

              mLegend << generate_legend(midterm, grade)
              # Stores values into a hash
              # Keys = homework name
              # Values = grade percentage
              mHash[midterm.name] = grade.earned.percent_of(midterm.total)
          end
      end
      #concat mHash
      if(!mHash.empty?)
          # Generates total field data
          mHash["Total"] = @m_earned.percent_of(@m_total)
          mLegend << "Midterm Total - #{@m_earned.percent_of(@m_total)}% (#{@m_earned}/#{@m_total})"
          
          # Sort hash alphabetically
          mHash.keys.sort
          
          # Generate google chart if homework exists and create image link
          data += generate_lower_modal_div(generate_chart(mHash, mLegend))
          data += "#{@m_earned.percent_of(@m_total)}% (#{@m_earned}/#{@m_total})</td>"
      else
          data +="</td>"
      end
      data.html_safe
    end
    def calc_final(student_id)
      data = "<td>"
      Grade.find_all_by_student_id(student_id).each do |grade|
        Task.find_all_by_id_and_category_id(grade.task_id, 4).each do |final|
              data += "#{grade.earned.percent_of(final.total)}% (#{grade.earned}/#{final.total})</td>"
          end
      end
      data.html_safe
    end
    def calc_course(student_id)
        @c_total = homework_total(student_id) + lab_total(student_id) + midterm_total(student_id) + final_total(student_id)

        if(@c_total != 0)
            raw("<td> #{@c_total.round(2)}%<td>" ) 
        else
            raw("<td>N/A</td>")
        end
        #raw("#{session[:hearned]}")
    end
    
    # Functions for calculating category totals
    def homework_total(student_id)
      @h_total = 0
      @h_earned = 0
      Grade.find_all_by_student_id(student_id).each do |grade|
          Task.find_all_by_id_and_category_id(grade.task_id, 1).each do |homework|
              @h_total += homework.total
              @h_earned += grade.earned
          end
      end
      return (@h_earned.percent_of(@h_total))*homework_weight
    end

    def lab_total(student_id)
      @l_total = 0
      @l_earned = 0
      Grade.find_all_by_student_id(student_id).each do |grade|
        Task.find_all_by_id_and_category_id(grade.task_id, 2).each do |lab|
            @l_total += lab.total
            @l_earned += grade.earned
        end
      end
      return @l_earned.percent_of(@l_total)*lab_weight
    end
    
    def midterm_total(student_id)
      @m_total
      @m_total
      Grade.find_all_by_student_id(student_id).each do |grade|
          Task.find_all_by_id_and_category_id(grade.task_id, 2).each do |midterm|
              @m_total += midterm.total
              @m_earned += grade.earned
          end
      end
      return @m_earned.percent_of(@m_total)*midterm_weight
    end

    def final_total(student_id)
      Grade.find_all_by_student_id(student_id).each do |grade|
        Task.find_all_by_id_and_category_id(grade.task_id, 4).each do |final|
              return grade.earned.percent_of(final.total)*final_weight
          end
      end
    end

    # Helper functions
    def generate_legend(homework, grade)
        return "#{homework.name} - #{grade.earned.percent_of(homework.total)}% (#{grade.earned}/#{homework.total})"
    end

    def generate_chart(hash, legend)
        return  Gchart.bar(:size => '600x200',
                           :bar_colors => '76A4FB',
                           :background => 'EEEEEE',
                           :data => hash.values, 
                           :axis_with_labels => ['x', 'y'],
                           :axis_labels => [hash.keys],
                           :legend => legend,   
                           :bar_width_and_spacing => '40,10',
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