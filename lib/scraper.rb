require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_colleges
    index_url = https://www.cappex.com/colleges-by-act/colleges-for-a-33-act
    scraped_colleges = {}
    scraped_array = Nokogiri::HTML(open(index_url))

      scraped_array.css("div.college-list--cards").each do |college|
          name = college.css("div.college-list--card-title-container a").value

          college.css("div.college-list--card-outer").each do |inner_data|
                      value = inner_data.css("div").attribute("content").value
                      inner_array << value
          end

          scraped_colleges = { :name =>
                  {
                    :average_act => inner_array[0]
                    :average_sat => inner_array[1]
                    :acceptance_rate => inner_array[2]
                    :public_or_private => inner_array[3]
                    :level_of_institution => inner_array[4]
                    :campus_setting => inner_array[5]
                    :tuition_cost => inner_array[6]
                    :number_of_students => inner_array[7]
                  }
          }

      end

      return scraped_colleges
  end

end
=begin
  def self.scrape_profile_page(profile_url)
    scraped_profile_array = Nokogiri::HTML(open(profile_url))
    students = {}
    student = {}

    url_array = scraped_profile_array.css(".social-icon-container a")
    url_array.each do |element|
        #:name => element.css("card-text-container student-name").text,
            if element.css("img").attribute("src").value.include?("twitter")
                student[:twitter] = element.attribute("href").value
            elsif element.css("img").attribute("src").value.include?("linkedin")
                student[:linkedin] = element.attribute("href").value
            elsif element.css("img").attribute("src").value.include?("github")
                student[:github] = element.attribute("href").value
            elsif element.css("img").attribute("src").value.include?("youtube")
                student[:youtube] = element.attribute("href").value
            elsif element.css("img").attribute("src").value.include?("rss")
                student[:blog] = element.attribute("href").value
            end
    end


    student[:profile_quote] = scraped_profile_array.css(".profile-quote").text
    student[:bio] = scraped_profile_array.css("div.description-holder p").text

    student
  end
=end
