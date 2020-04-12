require 'pry'

class Compare
  @@final_list = []

  def self.compare_act
    College.each do |x|
      if User.score.to_i >=
        @@final_list <<
      else
    end

  end

  def self.compare_price
    User.max_payment
  end

  def self.compare_preference
    User.priv_or_pub
  end

  def self.compare_studentpop
    User.student_pop
  end

  def self.display_matches

  end

end
