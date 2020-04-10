class College
  attr_accessor :name, :average_act, :average_sat, :acceptance_rate,
  attr_accessor :public_or_private, :level_of_institution, :campus_setting
  attr_accessor :tuition_cost, :number_of_students
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end


end
