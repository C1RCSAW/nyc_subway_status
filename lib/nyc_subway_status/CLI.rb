class NYCSubwayStatus::CLI

  def call
    list_trains
    train_details
  end

  def list_trains
    puts "NYC subway Status"
    @lines = NYCSubwayStatus::Line.all
  end

  def train_details

    input = nil
    while input != "q"
      puts "enter a number for a subway line to display status information: or 'l' to see the list of subway lines: or 'q' to quit:"

      input = gets.strip.downcase

      if input.to_i > 0
        puts @lines[input.to_i-1]
      elsif input == "l"
        list_trains
      elsif input == "q"
        goodbye
      else
        puts "not an option please try again "
      end
    end
  end

  def goodbye
    puts "See you later, have a nice ride on the subway!"
  end

end
