class College
  attr_accessor :name, :college_id, :average_act, :average_sat, :acceptance_rate, :public_or_private, :level_of_institution, :campus_setting, :tuition_cost, :number_of_students
  @@all = []

  def initialize(name,id)
    @name = name
    @id = college_id
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

  def self.get_average_act
    Scraper.scrape_act(@name, @id)
  end

  def self.get_average_sat
    Scraper.scrape_Sat(@name, @id)
  end

  def self.get_acceptance_rate
    Scraper.scrape_Acceptance_Rate(@name,@id)
  end

  def self.get_publicorprivate
    Scraper.scrape_PubOrPriv(@name,@id)
  end

  def self.get_levelofinstitution
    Scraper.scrape_LevelOfInstitution(@name,@id)
  end

  def self.get_campussetting
    Scraper.scrape_Campus_Setting(@name,@id)
  end

  def self.get_tuitioncost
    Scraper.scrape_Tuition_Cost(@name,@id)
  end

  def self.get_numofstudents
    Scraper.scrape_NumOfStudents(@name,@id)
  end

  def save
    @@all << self
  end

end
