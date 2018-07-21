#CLI Controller for User Interaction

class Animals::CLI

  def start
    puts "Welcome!"
    Animals::Scraper.scrape_duck_names
    puts " "
    main_menu
  end

  def main_menu
    puts "Here are the ducks living at Leilani Farm Sanctuary:"
    ducks = Animals::Ducks.all
    ducks.each.with_index(1) do |duck, index|
      puts "#{index}. #{duck.name}"
    end
    puts " "
    puts "Please select a duck's number to learn more about that duck!"

    # User input code 
    # input = gets.strip
    # index = input_to_i - 1
  end

end
