class User
  attr_accessor :name, :score, :max_payment, :priv_or_pub, :student_pop
  @@all = []

  def initialize(name, score, max_payment, priv_or_pub, student_pop)
    @name = name
    @score = score
    @max_payment = max_payment
    @priv_or_pub = priv_or_pub
    @student_pop = student_pop
    save
  end

  def self.name
    @@all.last.name
  end

  def self.score
    @@all.last.score
  end

  def self.max_payment
    @@all.last.max_payment
  end

  def self.priv_or_pub
    @@all.last.priv_or_pub
  end

  def self.student_pop
    @@all.last.student_pop
  end

  def self.all
    @@all
  end

  def save
    @@all << self
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
