class NYCSubwayStatus::CLI

  def call
    list_trains
    train_details
  end

  def list_trains
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>".yellow #add colorize gem!
    puts "NYC Subway Status"
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<".yellow
    NYCSubwayStatus::Line.destroy_all
    NYCSubwayStatus::Line.get_lines
    @lines = NYCSubwayStatus::Line.all
    @lines.each.with_index(1) do |line, i|
      puts "#{i}. #{line.name} - #{line.status}"
    end
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>".yellow
    puts Time.now
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<".yellow
  end

  def train_details

    input = nil
    while input != "q"
      puts "Enter a number for a subway line to display status details"
      puts "'l' to refresh the list"
      puts "'q' to quit:"

      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < @lines.length + 1
        puts @lines[input.to_i-1].details
        system("open #{@lines[input.to_i-1].details}")
      elsif input == "l"
        list_trains
      elsif input == "q"
        goodbye
      else
        puts "not an option please try again".red
      end
    end
  end

  def goodbye
    puts "See you later, have a nice ride on the subway!".yellow
  end

end
