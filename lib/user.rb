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

      j=0
      while j<50
        if score.to_i >= college_data[j][:average_act].to_i
            potential_schools << name_arr[j]
        end
        j = j +1
      end

      if potential_schools.length == 0
        puts "Please get your ACT Score up!"
      else
        #puts potential_schools
        return potential_schools
      end

    end

    def self.price_match(max_price, narrowed_list)
      data = self.scrape_colleges
      #puts data
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []
      price_arr = []

      narrowed_list.each do |college|
          if max_price.delete("$").delete(',') >= fin_hash[college][:tuition_cost].delete("$").delete(',')
              potential_schools << college
          end
      end
      if potential_schools.length == 0
        puts "Please look into financial aid before applying."
      end
      puts potential_schools
      return potential_schools
    end

    def self.pref_pub_priv(priv_or_pub,narrowed_list)
      data = self.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []

      if priv_or_pub == "1"
          pref = "Public"
      elsif priv_or_pub == "2"
          pref = "Private"
      end

      narrowed_list.each do |college|
          if pref == fin_hash[college][:public_or_private]
              potential_schools << college
          end
      end
      if potential_schools.length == 0
        puts "Please enter another preference [Enter 1 for PUBLIC or 2 for PRIVATE]."
      end
      puts potential_schools
      return potential_schools
    end

    def self.num_of_students(num_pref,narrowed_list)
      data = self.scrape_colleges
      name_arr = data[0]
      college_data = data[1]
      fin_hash = data[2]
      potential_schools = []

      narrowed_list.each do |college|
          if num_pref.to_i >= fin_hash[college][:number_of_students].delete(',').to_i
              potential_schools << college
          end
      end
      if potential_schools.length == 0
        puts "Please enter a larger numerical preference for student population."
      end
      puts potential_schools
      return potential_schools
    end

end

#Testing Cases Below...
=begin
narrowed_list = User.act_score(28)
narrowed_list = User.price_match("18,000", narrowed_list)
narrowed_list = User.pref_pub_priv(1,narrowed_list)
User.num_of_students(55000, narrowed_list)
=end
