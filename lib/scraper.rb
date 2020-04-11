require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  #scrape individual college data
  scraped_colleges = []
  y = scraped_array.css('.college-list--card-inner').css("div.college-list--card-data-val").text
  data_array = y.squeeze("\n").split("\n").select!{|val| !val.empty?}
  data_array.delete(" ")
  data_array.delete('')
  data_array.delete(nil)

  i=0
  while i<data_array.length
      scraped_college = {
        :average_act => data_array[i],
        :average_sat => data_array[i+1],
        :acceptance_rate => data_array[i+2],
        :public_or_private => data_array[i+3],
        :level_of_institution => data_array[i+4],
        :campus_setting => data_array[i+5],
        :tuition_cost => data_array[i+6],
        :number_of_students => data_array[i+7]
      }
      i = i + 8
      scraped_colleges << scraped_college
  end

  fin_hash = {}
  k=0
  while k<50
    fin_hash[name_arr[k]] = scraped_colleges[k]
    k = k + 1
  end



  def self.scrape_colleges
    index_url = "https://www.cappex.com/colleges-by-act/colleges-for-a-33-act"
    scraped_colleges = Nokogiri::HTML(open(index_url))
    i = 0

    scraped_colleges.css('.college-list--card-title-conatiner a').each do |x|
        name_proper = x.text.gsub(/\s+/,"_").gsub('-',"_").downcase.to_sym
        College.new(name_proper,i)  #for every iteration of college name we create a new college instance object
        i++
    end

    y = scraped_colleges.css('.college-list--card-inner').css("div.college-list--card-data-val").text

  end

  def self.scrape_Act(name)

    y = scraped_array.css('.college-list--card-inner').css("div.college-list--card-data-val").text
    data_array = y.squeeze("\n").split("\n").select!{|val| !val.empty?}
    data_array.delete(" ")
    data_array.delete('')
    data_array.delete(nil)
  end

  def self.scrape_Sat(name)
  end

  def self.scrape_Acceptance_Rate(name)
  end

  def self.scrape_PubOrPriv(name)
  end

  def self.scrape_LevelOfInstitution(name)
  end

  def self.scrape_Campus_Setting(name)
  end

  def self.scrape_Tuition_Cost(name)
  end

  def self.scrape_NumOfStudents(name)
  end

end

Scraper.scrape_colleges


=begin
class Scraper

  def self.scrape_colleges

    index_url = "https://www.cappex.com/colleges-by-act/colleges-for-a-33-act"

    inner_array = []
    scraped_array = Nokogiri::HTML(open(index_url))

    #scrape college names
    name_arr = []
    scraped_array.css('.college-list--card-title-conatiner a').each do |x|
        name_proper = x.text.gsub(/\s+/,"_").gsub('-',"_").downcase.to_sym
        name_arr << name_proper
    end

    #scrape individual college data
    scraped_colleges = []
    y = scraped_array.css('.college-list--card-inner').css("div.college-list--card-data-val").text
    data_array = y.squeeze("\n").split("\n").select!{|val| !val.empty?}
    data_array.delete(" ")
    data_array.delete('')
    data_array.delete(nil)

    i=0
    while i<data_array.length
        scraped_college = {
          :average_act => data_array[i],
          :average_sat => data_array[i+1],
          :acceptance_rate => data_array[i+2],
          :public_or_private => data_array[i+3],
          :level_of_institution => data_array[i+4],
          :campus_setting => data_array[i+5],
          :tuition_cost => data_array[i+6],
          :number_of_students => data_array[i+7]
        }
        i = i + 8
        scraped_colleges << scraped_college
    end

    fin_hash = {}
    k=0
    while k<50
      fin_hash[name_arr[k]] = scraped_colleges[k]
      k = k + 1
    end

    ret_array = [name_arr, scraped_colleges, fin_hash]
    return ret_array
  end

end

Scraper.scrape_colleges

=end
