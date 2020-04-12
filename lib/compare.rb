require 'pry'

class Compare
  @final_list = []

  def self.compare_act
    College.each do |school|
      if User.score.to_i >= school.average_act
        @final_list << school.name
      end
    end
  end

  def self.compare_price
    College.each do |school|
      if User.max_payment.to_i >= school.tuition_cost
        @final_list << school.name
      end
    end
  end

  def self.compare_preference
    College.each do |school|
      if User.priv_or_pub == school.public_or_private
        @final_list << school.name
      end
    end
  end

  def self.compare_studentpop
    College.each do |school|
      if User.student_pop <= school.public_or_private
        @final_list << school.number_of_students
      end
    end
  end

  def self.display_matches
    puts @final_list
  end

end
