class CollegeMatcher::User
  attr_accessor :name, :score, :max_payment, :priv_or_pub, :student_pop
  @@all = []

  def initialize(name, score, max_payment, priv_or_pub, student_pop)
    @name = name
    @score = score
    @max_payment = max_payment

    if priv_or_pub == 1
      @priv_or_pub = "Public"
    elsif prive_or_pub == 2
      @priv_or_pub = "Private"
    end

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

end
