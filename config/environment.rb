#require_relative '..bin/run'
require_relative "../lib/cli"
require_relative "../lib/college"
require_relative "../lib/scraper"
require_relative "../lib/user"
require_relative "../lib/compare"

require 'pry'
require 'nokogiri'
require 'open-uri'


module COLLEGES
  class Error < StandardError; end
  # Your code goes here...
end
