#CLI Controller for User Interaction

class Animals::CLI

  def start
    puts " "
    puts "Welcome!"
    Animals::Scraper.scrape_species
    puts " "
    list_animals
  end

  def list_animals
    puts "Here are the animals living at Leilani Farm Sanctuary:"
    puts " "
    animals = Animals::Species.all
    animals.each.with_index(1) do |species, index|
      puts "#{index}. #{species.name}"
    end
    main_menu
  end

  def main_menu
    input = nil
    puts " "
    while input != "exit"
      puts "Please select an animal's number to learn more or type 'exit'."

      input = gets.strip
      index = input.to_i - 1
      animal = Animals::Species.all[index]

      puts "You chose #{animal.name}!"

      puts " "

      puts "Here are all the members of the #{animal.name} community at Leilani Farm Sanctuary:"
      # Animals::Scraper.scrape_animal_details(animal)
      puts "Some animal names"
      puts " "
      puts "Type 'main menu' to go back or 'exit'."

        if input == "main_menu"
          list_animals
        else
          "Not sure what you meant. Please type 'main menu' or 'exit'."
        end
      end
    end

  end
