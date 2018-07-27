#Class responsible for scraping information from Leilani Farm Sanctuary website
class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-animals/"

    # First Level of Scraping: the names of the different species living on the farm
    def self.scrape_species
      page = Nokogiri::HTML(open(BASE_URL))
      page.css("div.et_pb_column.et_pb_column_1_2").each do |animal_page|
        name = animal_page.css("h4 span").text.gsub(/(\sSponsorship)|(Sponsorship)/, "")
        # Regex unable to identify HTML "&nbsp;" so some of the animal names have an extra space
        url = animal_page.css("a").attribute("href").value
        Animals::Species.new(name, url)
      end
    end

    # Second level of scraping: the name of the animals of each species living on the farm
    def self.scrape_community_details(animal)
      url = animal.url
      page = Nokogiri::HTML(open(url))
      page.css("div.et_pb_module h4").children.each do |info|
        name = info.text
        Animals::Community.new(name)
      end

      # possible future feature to scrape animal bios 
      # page.css("div.et_pb_text.et_pb_module p").children.each do |info|
      #   animal.member_bio = info.text
      # end
    end


end
