#This class will be responsible for scraping the website.

class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-animals/"

    def self.scrape_species
      species = []
      page = Nokogiri::HTML(open(BASE_URL))
      species_names = page.css("h4 span").map {|species_names| species_names.text.chomp("Sponsorship")}
      
    end

    # def self.scrape_duck_bios
    #   duck_descriptions = page.css("h4 p").map {|description| description.text}
    # end

    def self.scrape_animal_details(category)
        animal = []
        page = Nokogiri::HTML(open(category.url))
        category.animal_names = page.css("h4 strong").map {|animal_name| animal_name.text}
        #animal_names.each do |name|
        #  Animals::AnimalCategory.new(name)
        #end
        category.animal_bios = page.css(".et_pb_column .et_pb_text p").map {|animal_bio| animal_bio.text}
        #Animal::Ducks.all.each_with_index do |animal, index|
        #  animal.description = animal_descriptions[index]
        #end
        #duck_bios = page.css(".et_pb_column .et_pb_text p").map {|duck_bio| duck_bio.text}
    end


end
