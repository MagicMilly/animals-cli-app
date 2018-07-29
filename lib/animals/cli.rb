#CLI Controller for User Interaction

class Animals::CLI

  def start
    puts " "
    puts "Welcome!"
    Animals::Scraper.scrape_species
    puts " "
    list_animals
    main_menu
    goodbye
  end

  def list_animals
    puts "Here are the animals living at Leilani Farm Sanctuary:"
    puts " "
    animals = Animals::Species.all
    animals.each.with_index(1) do |species, index|
      puts "#{index}. #{species.name}"
    end
    puts " "
    puts "Please select an animal's number to learn more, or type 'exit'."
  end

  def main_menu
    input = nil
    while input != "exit"

      input = gets.strip.downcase
      index = input.to_i - 1

        # check for valid input
        if (0..14).include?(index)
           species = Animals::Species.all[index]
           puts "You chose #{species.name}!"
           puts " "
           puts "Here are all the members of the #{species.name} community at Leilani Farm Sanctuary:"
           puts " "
           Animals::Scraper.scrape_community_details(species)
           Animals::Community.list_member_names(species)
           puts " "
           puts "Please type 'main menu' to return to list, or 'exit'."

        elsif input == "main menu"
          list_animals

        elsif input == "exit"
          break
        else
          "Not sure what you meant. Please type a valid command."
        end
    end
  end

  # possible future feature: check for invalid input of words or numbers, and prompt user to 'try again'

  def goodbye
    puts "Thanks for checking out the animals at Leilani Farm Sanctuary!"
  end
end
