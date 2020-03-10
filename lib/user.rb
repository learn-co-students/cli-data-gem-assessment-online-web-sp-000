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

    #puts fin_hash
    #puts fin_hash[:university_of_california_los_angeles][:campus_setting]
    #puts fin_hash.length
    #return fin_hash
    #Hash[data_array.map {|x| }]
    #college_data = scraped_array
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


  i=0
  while (i < college_data.length) do
          puts college_data[i][:average_act]
      break
    end
      x.values.each do |y|
        puts y
        break
      end
      puts x.first
      puts x.fetch("average_act")
      puts x.first
      #puts x[:average_act]

      break
      if score.to_i >= x[average_act]
        potential_schools << x.first
        #data.select{|k, hash| hash[:act_score] >= "28" }
        #data.select{|key, hash| hash["client_id"] == "2180" }
        #potential_schools << x.partny:average_act]
      end
    end
    puts potential_schools
  end
end

User.act_score(28)
