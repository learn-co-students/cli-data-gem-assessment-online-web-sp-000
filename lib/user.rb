require 'open-uri'
require 'pry'
require 'nokogiri'

class User
  #attr_accessor

  def initialize
    self
  end

  def self.scrape_colleges

    index_url = "https://www.cappex.com/colleges-by-act/colleges-for-a-33-act"

    inner_array = []
    scraped_array = Nokogiri::HTML(open(index_url))

    #scrape college names
    name_arr = []
    scraped_array.css('.college-list--card-title-conatiner a').each do |x|
        #x.text.to_sym => :x
        #symbol = :"#{x}"
        name_proper = x.text.gsub(/\s+/,"_").gsub('-',"_").downcase.to_sym
        #name_proper = x.text.parameterize.underscore.to_sym
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
        #puts scraped_college
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


  def self.act_score(score)
      data = self.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []
      #puts data[:harvard_college][:average_act]

      j=0
      while j<50
        if score >= college_data[j][:average_act].to_i
            potential_schools << name_arr[j]
        end
        j = j +1
      end

      if potential_schools.length == 0
        puts "Please get your ACT Score up!"
      else
        puts potential_schools
    end

    def self.price_match(max_price)
      data = self.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []

      j=0
      while j<50
        if score >= college_data[j][:average_act].to_i
            potential_schools << name_arr[j]
        end
        j = j +1
      end
    end

    def self.pref_pub_priv(pref)
      #1=public, 2=private

    end
end

User.act_score(20)
