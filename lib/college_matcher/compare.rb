class CollegeMatcher::Compare
  @@final_list = []

  def self.compareAll
    CollegeMatcher::College.all.each do |school|
      if (CollegeMatcher::User.max_payment.to_i >= school.tuition_cost.delete("$").delete(',').to_i) && (CollegeMatcher::User.priv_or_pub == school.public_or_private) && (CollegeMatcher::User.student_pop.to_i >= school.number_of_students.to_i)
        @@final_list << school.name
      end
    end
  end

  def self.display_matches
    if @@final_list.length == 0
      puts "YOUR REQUIREMENTS ARE TOO STRICT AND/OR YOU NEED A HIGHER ACT SCORE!"
    else
      puts " "
      puts "YOUR COLLEGE MATCHES (IN NO PARTICULAR ORDER) ARE:"

      #remove the duplicates and output list
      output = @@final_list.uniq

      #print out each school name with a reference number in a list
      j = 1
      output.each do |col|
        puts "#{j}. #{col}"
        j = j+1
      end


      dd_response = " "
      while dd_response != "N" && dd_response !="exit"
      puts "Do you want to learn more about a particular match? [Enter Y or N]"
      dd_response = gets.chomp.strip.downcase
        if dd_response == 'y'
          puts "Enter the number of the match you want to learn more about:"
          number_response = gets.chomp.strip.to_i
            if number_response >= 1 && number_response <= output.length
                CollegeMatcher::College.all.each do |college_name|
                  if college_name.name == output[number_response - 1]
                    puts "  Name of School: #{college_name.name}"
                    puts "  Average Act Score: #{college_name.average_act}"
                    puts "  Average SAT Score: #{college_name.average_sat}"
                    puts "  Acceptance Rate: #{college_name.acceptance_rate}"
                    puts "  Public or Private: #{college_name.public_or_private}"
                    puts "  Institution Level: #{college_name.level_of_institution}"
                    puts "  Campus Setting: #{college_name.campus_setting}"
                    puts "  Tuition Cost: #{college_name.tuition_cost}"
                    puts "  Student Population: #{college_name.number_of_students}"
                  end
                end
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
