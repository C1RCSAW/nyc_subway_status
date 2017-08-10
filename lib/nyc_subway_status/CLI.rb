class NYCSubwayStatus::CLI

  def call
    puts "NYC subway Status"
    list_trains
    train_details
  end

  def list_trains
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
    puts "enter the number of the subway line you would like status information"
  end

end
