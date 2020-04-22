require_relative "../lib/college_matcher/cli"
require_relative "../lib/college_matcher/college"
require_relative "../lib/college_matcher/compare"
require_relative "../lib/college_matcher/scraper"
require_relative "../lib/college_matcher/user"
require_relative "../lib/college_matcher/version"

require 'pry'
require 'nokogiri'
require 'open-uri'


module CollegeMatcher
  class Error < StandardError; end
  # Your code goes here...
end
