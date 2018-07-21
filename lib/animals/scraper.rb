#This class will be responsible for scraping the website.

class Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-ducks/"

    def self.scrape_animal_profiles
      ducks = []
      page = Nokogiri::HTML(open(BASE_URL))
      duck_name = page.css("h4 strong").text
      binding.pry
      puts "end"
    end

end
