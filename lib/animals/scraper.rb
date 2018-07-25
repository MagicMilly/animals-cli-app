class Animals::Scraper

  BASE_URL = "http://leilanifarmsanctuary.com/meet-the-animals/"

    def self.scrape_species
      page = Nokogiri::HTML(open(BASE_URL))
      page.css("div.et_pb_column.et_pb_column_1_2").each do |animal_page|
        name = animal_page.css("h4 span").text.gsub(/(\s*Sponsorship)/, "")
        url = animal_page.css("a").attribute("href").value
        Animals::Species.new(name, url)
      end
    end

    # This method is instantiating new objects of the Animals::Community class to collect information due to the css formatting
    # of the website, rather than adding this info as attributes to the Animals::Species class.
    # def self.scrape_community_details(animal)
    #     url = animal.url
    #     page = Nokogiri::HTML(open(url))
        #binding.pry
        # animal.animal_names = page.css("h4 strong").map {|names| names.text}
          #animal_info = page.css("div.et_pb_module.et-waypoint").map do |info|
        # page.css("div.et_pb_module h4").children.each do |info|
        #   name = info.text
        #   binding.pry
        #   Animals::Community.new(name)
        # end

        # page.css("div.et_pb_text.et_pb_module p").children do |info|
        #   bio = info.text

          # animals << {
          #   :animal_names => animal_info.css("h4 strong").text,
          #   :animal_bios => animal_info.css("p").text
          # }
    #     end
    # end

    def self.scrape_community_details(animal)
      url = animal.url
      page = Nokogiri::HTML(open(url))

      page.css("div.et_pb_module h4").children.each do |info|
        animal.member_name = info.text
        binding.pry 
      end

      page.css("div.et_pb_text.et_pb_module p").children.each do |info|
        animal.member_bio = info.text
      end
    end


end
