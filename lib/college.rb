require 'pry'

class College
  attr_accessor :name, :college_id, :average_act, :average_sat, :acceptance_rate, :public_or_private, :level_of_institution, :campus_setting, :tuition_cost, :number_of_students
  @@all = []

  def initialize(name,id)
    @name = name
    @id = id
    @average_act = get_average_act
    @average_sat = get_average_sat
    @acceptance_rate = get_acceptance_rate
    @public_or_private = get_publicorprivate
    @level_of_institution = get_levelofinstitution
    @campus_setting = get_campussetting
    @tuition_cost = get_tuitioncost
    @number_of_students = get_numofstudents
    save
  end

  #def self.get_college_info
  #  Scraper.scrape_college_info
  #end

  def get_average_act
    #scrape_Act(name,id)
    Scraper.scrape_Act(@name, @id)
  end

  def get_average_sat
    Scraper.scrape_Sat(@name, @id)
  end

  def get_acceptance_rate
    Scraper.scrape_Acceptance_Rate(@name,@id)
  end

  def get_publicorprivate
    Scraper.scrape_PubOrPriv(@name,@id)
  end

  def get_levelofinstitution
    Scraper.scrape_LevelOfInstitution(@name,@id)
  end

  def get_campussetting
    Scraper.scrape_Campus_Setting(@name,@id)
  end

  def get_tuitioncost
    Scraper.scrape_Tuition_Cost(@name,@id)
  end

  def get_numofstudents
    Scraper.scrape_NumOfStudents(@name,@id)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    #puts self.name
    #puts self.average_act
    #puts self.average_sat
    #puts self.acceptance_rate
    #puts self.public_or_private
    #puts self.level_of_institution
    #puts self.campus_setting
    #puts self.tuition_cost
    #puts self.number_of_students
  end

end
