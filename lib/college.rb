class College
  attr_accessor :name, :average_act, :average_sat, :acceptance_rate,
  attr_accessor :public_or_private, :level_of_institution, :campus_setting
  attr_accessor :tuition_cost, :number_of_students
  @@all = []

  def initialize(name)
    @name = name
    @average_act = self.get_average_act
    @average_sat = self.get_average_sat
    @acceptance_rate = self.get_acceptance_rate
    @public_or_private = self.get_publicorprivate
    @level_of_institution = self.get_levelofinstitution
    @campus_setting = self.get_campussetting
    @tuition_cost = self.get_tuitioncost
    @number_of_students = self.get_numofstudents
    save
  end

  def item_container

  end

  def get_average_act
  end

  def get_average_sat
  end

  def get_acceptance_rate
  end

  def get_publicorprivate
  end

  def get_levelofinstitution
  end

  def get_campussetting
  end

  def get_tuitioncost
  end

  def get_numofstudents
  end

  def save
    @@all << self
  end


end
