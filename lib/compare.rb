require 'pry'
require_relative '../lib/college'
require_relative '../lib/user'

class Compare
  @@final_list = []

  def self.compareAll
    College.all.each do |school|
      if (User.score.to_i >= school.average_act.to_i) && (User.max_payment.to_i >= school.tuition_cost.delete("$").delete(',').to_i) && (User.student_pop.to_i <= school.number_of_students.to_i)
        @@final_list << school.name
      end
    end
  end

  def self.compare_act
    #puts User.name.score.to_i
    puts User.score.to_i
    College.all.each do |school|
      if User.score.to_i >= school.average_act.to_i
        @@final_list << school.name
      end
    end
  end

  def self.compare_price
    puts User.max_payment.to_i
    College.all.each do |school|
      if User.max_payment.to_i >= school.tuition_cost.delete("$").delete(',').to_i
        @@final_list << school.name
      end
    end
  end

  def self.compare_preference
          puts User.priv_or_pub
    College.all.each do |school|
      if User.priv_or_pub == school.public_or_private
        @@final_list << school.name
      end
    end
  end

  def self.compare_studentpop
          puts User.student_pop.to_i
    College.all.each do |school|
      #puts school.number_of_students.delete(',').to_i
      if User.student_pop.to_i >= school.number_of_students.delete(',').to_i
        @@final_list << school.name
      end
    end
  end

  def self.display_matches
    #remove the duplicates

    puts @@final_list
  end

end
