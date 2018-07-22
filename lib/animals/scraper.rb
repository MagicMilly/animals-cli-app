#This class will be responsible for scraping the website.

class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-animals/"

    def self.scrape_species
      species = []
      page = Nokogiri::HTML(open(BASE_URL))
      page.css("div.et_pb_column.et_pb_column_1_2").each do |animal_page|
        name = animal_page.css("h4 span").text.chomp("Sponsorship")
        url = animal_page.css("a").attribute("href").value
        Animals::Species.new(name, url)
      end
    end

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
