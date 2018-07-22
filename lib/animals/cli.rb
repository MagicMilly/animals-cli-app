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

    # User input code
    input = gets.strip
    index = input.to_i - 1

    animal = Animals::Species.all[index]

    puts "You chose #{animal.name}!"
    puts "Here are all the #{animal.name}s at Leilani Farm Sanctuary:"

  end




end
