require 'nokogiri'
require 'open-uri'
require_relative '../lib/user'

class Scraper
  index_url = "https://www.cappex.com/colleges-by-act/colleges-for-a-#{User.score}-act"
  puts "We will be using the Cappex website: #{index_url}"
  @scraped_colleges = []
  @scraped_colleges = Nokogiri::HTML(open(index_url))

  def self.scrape_colleges
    id = 0
    @scraped_colleges.css('.college-list--card-title-conatiner a').each do |x|
        name_proper = x.text.gsub(/\s+/,"_").gsub('-',"_").downcase.to_sym
        College.new(name_proper,id)
        id = id + 8   #for every iteration of college name we create a new college instance object
    end
  end

  #scrape individual college data

=begin
  y = @scraped_colleges.css('.college-list--card-inner').css("div.college-list--card-data-val").text
  @data_array = y.squeeze("\n").split("\n").select!{|val| !val.empty?}
  @data_array.delete(" ")
  @data_array.delete('')
  @data_array.delete(nil)
=end


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
