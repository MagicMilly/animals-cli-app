#This class will be responsible for scraping the website.

class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-ducks/"

    def self.scrape_duck_names
      ducks = []
      page = Nokogiri::HTML(open(BASE_URL))
      duck_names = page.css("h4 strong").map {|duck_name| duck_name.text}
      duck_names.each do |name|
        Animals::Ducks.new(name)
      end
    end

    # def self.scrape_duck_bios
    #   duck_descriptions = page.css("h4 p").map {|description| description.text}
    # end

    # def self.scrape_duck_bios
    #   page = Nokogiri::HTML(open(BASE_URL))
    #   duck_bios = page.css.et_overlay et_pb_inline_icon("p").map {|duck_bio| duck_bio.text}
    # end


end
