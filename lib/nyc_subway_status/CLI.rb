class NYCSubwayStatus::CLI

  def call
    list_trains
    train_details
  end

  def list_trains
    puts "NYC subway Status"
    puts <<-DOC.gsub /^\s*/, ''
    1. 1,2,3
    2. 4,5,6
    3. 7
    4. A,C,E
    5. B,D,F,M
    6. G
    7. N,Q,R,W
    8. S
    9. SIR
    DOC
  end

  def train_details
    puts "enter the number for a subway line to display status information:"
    input = gets.strip
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
    end
  end

end
