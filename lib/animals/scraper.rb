#This class will be responsible for scraping the website.

class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-animals/"

    def self.scrape_species
      # species = []
      page = Nokogiri::HTML(open(BASE_URL))
      page.css("div.et_pb_column.et_pb_column_1_2").each do |animal_page|
        name = animal_page.css("h4 span").text.gsub(/(\s*Sponsorship)/, "")
        url = animal_page.css("a").attribute("href").value
        Animals::Species.new(name, url)
      end
    end

    def self.scrape_animal_details(animal)
        animals = []
        url = animal.url
        page = Nokogiri::HTML(open(url))
        # animal.animal_names = page.css("h4 strong").map {|names| names.text}
          animal_info = page.css("div.et_pb_module.et-waypoint").map do |info|
          animals << {
            :animal_names => animal_info.css("h4 strong").text,
            :animal_bios => animal_info.css("p").text
          }
        end
        animals
    end
end
