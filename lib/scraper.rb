require 'nokogiri'
require 'open-uri'
require_relative 'user'

class Scraper

=begin
  if User.all.empty? == true
    url_act = 36
  elsif User.all.empty? == false
     url_act = User.all.last.score
  end

  index_url = "https://www.cappex.com/colleges-by-act/colleges-for-a-#{url_act}-act"
  @scraped_colleges = []
  @scraped_colleges = Nokogiri::HTML(open(index_url))
=end


  def self.scrape_colleges
    index_url = "https://www.cappex.com/colleges-by-act/colleges-for-a-#{User.all.last.score}-act"
    @scraped_colleges = []
    @scraped_colleges = Nokogiri::HTML(open(index_url))

    id = 0
    @scraped_colleges.css('.college-list--card-title-conatiner a').each do |x|
        name_proper = x.text.gsub(/\s+/,"_").gsub('-',"_").downcase.to_sym
        College.new(name_proper,id)
        id = id + 8   #for every iteration of college name we create a new college instance object
    end
  end

  def self.scrape_college_info
    y = @scraped_colleges.css('.college-list--card-inner').css("div.college-list--card-data-val").text
    data_array = y.squeeze("\n").split("\n").select!{|val| !val.empty?}
    data_array.delete(" ")
    data_array.delete('')
    data_array.delete(nil)
    return data_array
  end

  def self.scrape_Act(name,id)
    info = Scraper.scrape_college_info
    info[id]
    #@data_array[id]
  end

  def self.scrape_Sat(name,id)
    info = Scraper.scrape_college_info
    info[id+1]
  end

  def self.scrape_Acceptance_Rate(name,id)
    info = Scraper.scrape_college_info
    info[id+2]
  end

  def self.scrape_PubOrPriv(name,id)
    info = Scraper.scrape_college_info
    info[id+3]
  end

  def self.scrape_LevelOfInstitution(name,id)
    info = Scraper.scrape_college_info
    info[id+4]
  end

  def self.scrape_Campus_Setting(name,id)
    info = Scraper.scrape_college_info
    info[id+5]
  end

  def self.scrape_Tuition_Cost(name,id)
    info = Scraper.scrape_college_info
    info[id+6]
  end

  def self.scrape_NumOfStudents(name,id)
    info = Scraper.scrape_college_info
    info[id+7]
  end
end
