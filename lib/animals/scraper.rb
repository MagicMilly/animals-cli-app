#This class will be responsible for scraping the website.

class Animals::Scraper

  MAIN_URL = "http://leilanifarmsanctuary.com/meet-the-ducks/"

    def self.scrape_animal_profiles
      ducks = []
      page = Nokogiri::HTML(open(MAIN_URL))
      duck_name = page.css("h4 strong")
      binding.pry
    end

end
