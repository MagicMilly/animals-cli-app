#This class will be responsible for scraping the website.

class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-ducks/"

    def self.scrape_animal_profiles
      ducks = []
      page = Nokogiri::HTML(open(BASE_URL))
      duck_names = page.css("h4 strong").map {|name| name.text}
      # duck_descriptions = page.css("h4 p").map {|description| description.text}
      binding.pry
      puts "end"
    end

end
