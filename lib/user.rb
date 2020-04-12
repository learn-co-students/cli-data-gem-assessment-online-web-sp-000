require 'pry'
require_relative '../lib/compare'

class User
  attr_accessor :score, :max_payment, :priv_or_pub, :student_pop

  def initialize(name)
    @name = name
  end

  def add_score_to_profile(user_score)
    self.score = user_score
  end

  def add_payment_to_profile(user_max_payment)
    self.max_payment = user_max_payment
  end

  def add_preference_to_profile(user_priv_or_pub)
    self.priv_or_pub = user_priv_or_pub
  end

  def add_pop_to_profile(user_student_pop)
    self.student_pop = user_student_pop
  end

end

=begin
  def self.act_score(score)
      data = Scraper.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []

      j=0
      while j<50
        if score.to_i >= college_data[j][:average_act].to_i
            potential_schools << name_arr[j]
        end
        j = j +1
      end

      if potential_schools.length == 0
        puts "Please get your ACT Score up!"
      else
        #puts potential_schools
        return potential_schools
      end

    end

    def self.price_match(max_price, narrowed_list)
      data = Scraper.scrape_colleges
      #puts data
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []
      price_arr = []

      narrowed_list.each do |college|
          if max_price.delete("$").delete(',') >= fin_hash[college][:tuition_cost].delete("$").delete(',')
              potential_schools << college
          end
      end
      if potential_schools.length == 0
        puts "Please look into financial aid before applying."
      end
      #puts potential_schools
      return potential_schools
    end

    def self.pref_pub_priv(priv_or_pub,narrowed_list)
      data = Scraper.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []

      if priv_or_pub == "1"
          pref = "Public"
      elsif priv_or_pub == "2"
          pref = "Private"
      end

      narrowed_list.each do |college|
          if pref == fin_hash[college][:public_or_private]
              potential_schools << college
          end
      end
      if potential_schools.length == 0
        puts "Your requirements are too strict. Please reevaluate your preferences and restart."
      end
      puts potential_schools
      return potential_schools
    end

    def self.num_of_students(num_pref,narrowed_list)
      data = Scraper.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []

      narrowed_list.each do |college|
          if num_pref.to_i >= fin_hash[college][:number_of_students].delete(',').to_i
              potential_schools << college
          end
      end
      if potential_schools.length == 0
        puts "Your requirements are too strict. Please reevaluate your preferences and restart."
      end
      puts potential_schools
      return potential_schools
    end

end

=end

#Testing Cases Below...
=begin
narrowed_list = User.act_score(28)
narrowed_list = User.price_match("18,000", narrowed_list)
narrowed_list = User.pref_pub_priv(1,narrowed_list)
User.num_of_students(55000, narrowed_list)
=end
