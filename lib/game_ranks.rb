require 'httparty'
require 'nokogiri'
require 'colorize'
require 'ruby-beautify'
require 'byebug'

def scraper
  url = 'https://steam250.com/tag/indie'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  game_ranking = parsed_page.css('div#1')
  game_ranking.each do |game_rank|
    game ={
        title: game_rank.css('span.title')[0].text

    }
  byebug
end
scraper


# parsed_page.css('span.title')[4].text
# parsed_page.css('div#1')
