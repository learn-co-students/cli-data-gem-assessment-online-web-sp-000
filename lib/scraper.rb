require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_colleges()
    index_url = https://www.cappex.com/colleges-by-act/colleges-for-a-33-act
    scraped_colleges = []
    scraped_array = Nokogiri::HTML(open(index_url))

      scraped_array.css("div.college-list--cards").each do |college|

          scraped_college = {
                    :average_act => college.css(".student-name").text,
                    :tuition_cost => college.css("a").attribute("href").value,
                    :public_or_private => college.css(".student-location").text,
                    :profile_url => college.css("a").attribute("href").value
                          }

          scraped_colleges << scraped_college
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
