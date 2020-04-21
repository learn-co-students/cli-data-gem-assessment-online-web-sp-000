class CLI

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
    puts "1) What is your ACT score? [Enter a Number between 0-36]"
      score = gets.chomp

    puts "2) What is the maximum amount you are willing to pay per year? [Enter a Number between 0 & 100000]"
      max_payment = gets.chomp

    puts "3) Do you prefer a public or private college? [Enter #{"Public"} or #{"Private"}]"
      priv_or_pub = gets.chomp

    puts "4) What is the maximum amount of students you prefer? [Enter a Number between 0 & 70000]"
      student_pop = gets.chomp

      new_user = User.new(user_name,score,max_payment,priv_or_pub,student_pop)
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
