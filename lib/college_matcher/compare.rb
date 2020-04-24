class CollegeMatcher::Compare
  @@final_list = []

  def self.compareAll
    CollegeMatcher::College.all.each do |school|
      if (CollegeMatcher::User.max_payment.to_i >= school.tuition_cost.delete("$").delete(',').to_i) && (CollegeMatcher::User.priv_or_pub == school.public_or_private) && (CollegeMatcher::User.student_pop.to_i >= school.number_of_students.to_i)
        @@final_list << school
      end
    end
  end

  def self.display_matches
    if @@final_list.length == 0
      puts "YOUR REQUIREMENTS ARE TOO STRICT!"
    else
      #remove the duplicates and sort
      output = @@final_list.sort_by{|col| col.name}.uniq

      #print out each school name with a reference number in a list
      puts " "
      puts "YOUR COLLEGE MATCHES (Sorted Alphabetically) ARE:"
      output.each.with_index(1) do |col , index|
        puts "#{index}. #{col.name}"
      end

      dd_response = " "
      while dd_response != "N" && dd_response !="exit"
      puts "Do you want to learn more about a particular match? [Enter Y or N]"
      dd_response = gets.chomp.strip.downcase
        if dd_response == 'y'
          puts "Enter the number of the match you want to learn more about:"
          number_response = gets.chomp.strip.to_i
            if number_response >= 1 && number_response <= output.count
                    college = output[number_response - 1]
                    puts "  Name of School: #{college.name}"
                    puts "  Average Act Score: #{college.average_act}"
                    puts "  Average SAT Score: #{college.average_sat}"
                    puts "  Acceptance Rate: #{college.acceptance_rate}"
                    puts "  Public or Private: #{college.public_or_private}"
                    puts "  Institution Level: #{college.level_of_institution}"
                    puts "  Campus Setting: #{college.campus_setting}"
                    puts "  Tuition Cost: #{college.tuition_cost}"
                    puts "  Student Population: #{college.number_of_students}"
            else
              puts "Please enter a valid school number on the list!"
            end
        else
          break
        end
    end
   end

      puts "Good luck with your applications #{CollegeMatcher::User.name}!"
 end

end
