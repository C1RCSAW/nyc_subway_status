class NYCSubwayStatus::CLI

  def call
    list_trains
    train_details
  end

  def list_trains
    puts ">>>>>>>>>>>>>>>>>" #add colorize gem!
    puts "NYC subway Status"
    puts Time.now
    puts "<<<<<<<<<<<<<<<<<"
    @lines = NYCSubwayStatus::Line.all
    @lines.each.with_index(1) do |line, i|
      puts "#{i}. #{line.name} - #{line.status}"
    end
  end

  def train_details

    input = nil
    while input != "q"
      puts "enter a number for a subway line to display status details: or 'l' to see the list of subway lines: or 'q' to quit:"

      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < @lines.length + 1
        puts @lines[input.to_i-1].status
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
