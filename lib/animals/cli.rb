#CLI Controller for User Interaction

class Animals::CLI

  def start
    puts "Welcome!"
    Animals::Scraper.scrape_duck_names 
    main_menu
  end

  def main_menu
    puts "Here are the ducks living at Leilani Farm Sanctuary:"
    ducks = Animals::Ducks.all
    ducks.each.with_index(1) do |duck, index|
      puts "#{index}. #{duck.name}"
    end
  end

end
