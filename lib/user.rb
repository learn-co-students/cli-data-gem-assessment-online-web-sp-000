require 'open-uri'
require 'pry'
require 'nokogiri'

class User
  #attr_accessor

  def initialize
    self
  end

  def self.act_score(score)
    data = Scraper.scrape_colleges
    potential_schools = []
    data.each do |x|
      if x[:average_act].to_i <= score.to_i
        #data.select{|k, hash| hash[:act_score] >= "28" }
        #data.select{|key, hash| hash["client_id"] == "2180" }
        potential_schools << x.partny:average_act]
      end
    end
    puts potential_schools
  end
end

User.act_score(32)
