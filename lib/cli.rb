#require_relative './lib/scraper'

class CLI

  def self.call
    puts "Hello, Welcome to the College Matcher!"
    puts "We will be using the Cappex Website"
    puts "https://www.cappex.com/colleges-by-act/colleges-for-a-33-act"
    Scraper.scrape_colleges
    CLI.get_user_info
    Compare.compare_act
    Compare.compare_price
    Compare.compare_preference
    Compare.compare_studentpop
    Compare.display_matches

    CLI.final_greeting
  end

  def self.get_user_info
    #ask for user name
    puts "What is your first name?"
    user_name = gets.chomp

    #Ask the user the following questions to build out the profile
    puts "Please answer the following questions to help us match you:"
    puts "What is your ACT score? [Enter a Number between 0-36]"
      score = gets.chomp

    puts "What is the maximum amount you are willing to pay per year? [Enter a Number between 0 & 100000]"
      max_payment = gets.chomp

    puts "Do you prefer a public or private college? [Enter 1 for PUBLIC or 2 for PRIVATE]"
      priv_or_pub = gets.chomp

    puts "What is the maximum amount of students you prefer? [Enter a Number between 0 & 70000]"
      student_pop = gets.chomp

    #create an instance of the user class and build the profile
      #new_user.score = score
      #new_user.add_score_to_profile(score)
      #new_user.max_payment = max_payment
      #new_user.add_payment_to_profile(max_payment)
      #new_user.priv_or_pub = priv_or_pub
      #new_user.add_preference_to_profile(priv_or_pub)
      #new_user.student_pop = student_pop
      #new_user.add_pop_to_profile(student_pop)
      new_user = User.new(user_name,score,max_payment,priv_or_pub,student_pop)
  end

  def self.final_greeting
    puts "Good luck with your applications!"
    puts "Try Again? [Enter Y or N]"
      play_again = gets.chomp
      if play_again == "Y"
        #run file again

      else
        exit
      end
  end

end
