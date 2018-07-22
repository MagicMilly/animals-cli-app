#CLI Controller for User Interaction

class Animals::CLI

  def start
    puts "Welcome!"
    Animals::Scraper.scrape_species
    puts " "
    main_menu
  end

  def main_menu
    puts "Here are the animals living at Leilani Farm Sanctuary:"
    animals = Animals::Species.all
    animals.each.with_index(1) do |species, index|
      puts "#{index}. #{species.name}"
    end
    puts " "
    puts "Please select an animal's number to learn more"
  end
  #
  #   # User input code
  #   # input = gets.strip
  #   # index = input_to_i - 1
  # end

end
