class CLI

  def call
    puts "Hello, Welcome to the College Matcher!"
    puts "We will be using the Cappex Website"
    puts "https://www.cappex.com/colleges-by-act/colleges-for-a-33-act"
    Scraper.scrape_colleges
  end

end
