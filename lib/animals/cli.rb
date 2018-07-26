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
    puts " "
    puts "Please select an animal's number to learn more."
    main_menu
  end

  def main_menu
    # input = nil
    # while input != "exit"
      input = gets.strip
      index = input.to_i - 1
      animal = Animals::Species.all[index]

      puts "You chose #{animal.name}!"

      puts " "

      puts "Here are all the members of the #{animal.name} community at Leilani Farm Sanctuary:"
      puts " "
      Animals::Scraper.scrape_community_details(animal)
      # Animals::Community.all.each {|member| puts member.name}
      # display_community_members(animal)
      puts " "
      # puts "Type 'main menu' to go back or 'exit'."

      # if input.downcase == "main_menu"
      #   list_animals
      # else
      #   "Not sure what you meant. Please type 'main menu' or 'exit'."
      # end
    # end
  end

  def display_community_members(animal)
    Animals::Species.all.each do |animal|
      puts "#{animal.member_name}"
    end
  end
end
