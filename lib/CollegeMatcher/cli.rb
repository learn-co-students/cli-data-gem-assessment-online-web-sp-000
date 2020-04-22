class CollegeMatcher::CLI

  def self.call
    puts "Hello, Welcome to the College Matcher!"

    #get user info
    CLI.get_user_info

    #scrape the college data according to user's info
    puts "GENERATING MATCHES...Please Wait!"
    Scraper.scrape_colleges

    #compare user's info to colleges to match
    Compare.compareAll

    #display the final matches
    Compare.display_matches

    #display final greeting
    CLI.final_greeting
  end

  def self.get_user_info
    #ask for user name
    puts "What is your first name?"
    user_name = gets.chomp

    #Ask the user the following questions to build out the profile
    puts "Please answer the following 4 questions to help us match you:"

    answer = " "
    while answer != exit
    puts "1) What is your ACT score? [Enter a Number between 18-36]"
    score = gets.chomp
      if score.instanceOf == integer && score > 17 && score < 37
          puts "2) What is the maximum amount you are willing to pay per year? [Enter a Number between 0 & 100000]"
          max_payment = gets.chomp
           if max_payment.instanceOf == integer && max_payment > 0
              puts "3) Do you prefer a public or private college? [Enter 1 for Public & 2 for Private]"
              priv_or_pub = gets.chomp
                if priv_or_pub.instanceOf == integer && priv_or_pub > 0 && priv_or_pub < 3
                  puts "4) What is the maximum amount of students you prefer? [Enter a Number between 0 & 70000]"
                  student_pop = gets.chomp
                    if student_pop.instanceOf == integer && student_pop > 0
                      new_user = User.new(user_name,score,max_payment,priv_or_pub,student_pop)
                    end
                end
              end
            end
          end
        end


  def self.final_greeting
    puts "Try Again? [Enter Y or N]"
      play_again = gets.chomp
      if play_again == "Y"
        #run application again
        system("ruby bin/run")
      else
        exit
      end
  end

end
