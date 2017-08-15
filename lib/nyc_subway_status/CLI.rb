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
      puts "enter a number for a subway line to display status information: or 'list' to see the list of subway lines: or 'q' to quit:"

      input = gets.strip.downcase
      case input
      when "1"
        puts "status information for 1,2,3 subway line"
      when "2"
        puts "status information for 4,5,6 subway line"
      when "3"
        puts "status information for 7 subway line"
      when "4"
        puts "status information for A,C,E subway line"
      when "5"
        puts "status information for B,D,F,M subway line"
      when "6"
        puts "status information for G subway line"
      when "7"
        puts "status information for N,Q,R,W subway line"
      when "8"
        puts "status information for S subway line"
      when "9"
        puts "SIR"
      when "list"
        list_trains
      when "q"
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
