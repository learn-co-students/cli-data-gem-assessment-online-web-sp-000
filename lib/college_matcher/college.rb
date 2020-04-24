class CollegeMatcher::College
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

  def get_average_act
    CollegeMatcher::Scraper.scrape_Act(@name, @id)
  end

  def get_average_sat
    CollegeMatcher::Scraper.scrape_Sat(@name, @id)
  end

  def get_acceptance_rate
    CollegeMatcher::Scraper.scrape_Acceptance_Rate(@name,@id)
  end

  def get_publicorprivate
    CollegeMatcher::Scraper.scrape_PubOrPriv(@name,@id)
  end

  def get_levelofinstitution
    CollegeMatcher::Scraper.scrape_LevelOfInstitution(@name,@id)
  end

  def get_campussetting
    CollegeMatcher::Scraper.scrape_Campus_Setting(@name,@id)
  end

  def get_tuitioncost
    CollegeMatcher::Scraper.scrape_Tuition_Cost(@name,@id)
  end

  def get_numofstudents
    CollegeMatcher::Scraper.scrape_NumOfStudents(@name,@id)
  end

  def self.all
    @@all.sort_by{|col| col.name}
  end

  def save
    @@all << self
  end

end
