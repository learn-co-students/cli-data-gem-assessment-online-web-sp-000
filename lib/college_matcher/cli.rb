class CollegeMatcher::CLI

  def self.call
    puts "Hello, Welcome to the College Matcher!"

    #get user info
    CollegeMatcher::CLI.get_user_info

    #scrape the college data according to user's info
    puts "GENERATING MATCHES...Please Wait!"
    CollegeMatcher::Scraper.scrape_colleges

    #compare user's info to colleges to match
    CollegeMatcher::Compare.compareAll

    #display the final matches
    CollegeMatcher::Compare.display_matches

    #display final greeting
    CollegeMatcher::CLI.final_greeting
  end

  def self.get_user_info
    #ask for user name
    puts "What is your first name?"
    user_name = gets.chomp

    #Ask the user the following questions to build out the profile
    puts "Please answer the following 4 questions to help us match you: (enter 'exit' if you want to leave)"

    answer = " "
    while answer != 'exit'
      puts "1) What is your ACT score? [Enter a Number between 18-36]"
      score = gets.chomp.strip.downcase.to_i
      if score > 17 && score < 36
          puts "2) What is the maximum amount you are willing to pay per year? [Enter a Number between 0 & 100000]"
          max_payment = gets.chomp.strip.downcase.to_i
           if max_payment > 0 && max_payment < 100000
              puts "3) Do you prefer a public or private college? [Enter 1 for Public & 2 for Private]"
              priv_or_pub = gets.chomp.strip.downcase.to_i
                if priv_or_pub > 0 && priv_or_pub < 3
                  puts "4) What is the maximum amount of students you prefer? [Enter a Number between 0 & 70000]"
                  student_pop = gets.chomp.strip.downcase.to_i
                    if student_pop > 0 && student_pop < 70000
                      new_user = CollegeMatcher::User.new(user_name,score,max_payment,priv_or_pub,student_pop)
                      break
                    end
                 end
            end
        end
      end
  end


  def self.final_greeting
    puts "Try Again? [Enter Y or N]"
      play_again = gets.chomp.strip
      if play_again == "Y"
        #run application again
        system("ruby bin/college_matcher")
      else
        exit
      end
  end

end
