class NYCSubwayStatus::Line
  attr_accessor :name, :status, :details

  URL = 'http://web.mta.info/status/serviceStatus.txt'

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.get_lines
    (0..get_names.size).each do |i|
      line_name = get_names[i]
      line_status = get_status[i]

      line = Line.new
      line.name =  line_name
      line.venue_name =  line_status
      line.save
    end
    binding.pry
  end

  # def self.get_lines(url=URL)
  #   doc = Nokogiri::HTML(open(url))
  #   lines = []
  #   doc.xpath("//line")[0..10].each do |l|
  #     l.xpath("//name", "//status")[0..10].collect do |n, s|
  #       lines << {name: n.children.text, status: s.children.text}
  #     end
  #   end
  #     binding.pry
  # end

  def self.get_names(url=URL)
    doc = Nokogiri::HTML(open(url))
    names = []
    doc.xpath("//name")[0..10].collect do |n|
      names << n.children.text
    end
    names
  end

  def self.get_status(url=URL)
    status = []
    doc = Nokogiri::HTML(open(url))
    doc.xpath("//status")[0..10].collect do |s|
      status << s.children.text
    end
    status
  end

  # line_name = n.children.text
  # line_status = s.children.text
  # @lines << {name: line_name, status: line_status}

  # def initialize(name, status)
  #   @names.each do |n|
  #     self.new.name = n
  #     all << self
  #   end
  # end


#http://www.mta.info/status/subway/123
#http://www.mta.info/status/subway/456
#http://www.mta.info/status/subway/7
#http://www.mta.info/status/subway/ACE
#http://www.mta.info/status/subway/BDFM
#http://www.mta.info/status/subway/G
#http://www.mta.info/status/subway/JZ
#http://www.mta.info/status/subway/L
#http://www.mta.info/status/subway/NQRW
#http://www.mta.info/status/subway/S
#http://www.mta.info/status/subway/SIR

  # def self.all
  #
  #   line_1 = self.new
  #   line_1.name = "1,2,3"
  #   line_1.status = "Good Service"
  #
  #   line_2 = self.new
  #   line_2.name = "4,5,6"
  #   line_2.status = "Good Service"
  #
  #   line_3 = self.new
  #   line_3.name = "7"
  #   line_3.status = "Good Service"
  #
  #   line_4 = self.new
  #   line_4.name = "A,C,E"
  #   line_4.status = "Good Service"
  #
  #   line_5 = self.new
  #   line_5.name = "B,D,F,M"
  #   line_5.status = "Good Service"
  #
  #   line_6 = self.new
  #   line_6.name = "G"
  #   line_6.status = "Good Service"
  #
  #   line_7 = self.new
  #   line_7.name = "J,Z"
  #   line_7.status = "Good Service"
  #
  #   line_8 = self.new
  #   line_8.name = "L"
  #   line_8.status = "Good Service"
  #
  #   line_9 = self.new
  #   line_9.name = "N,Q,R,W"
  #   line_9.status = "Good Service"
  #
  #   line_10 = self.new
  #   line_10.name = "S"
  #   line_10.status = "Good Service"
  #
  #   line_11 = self.new
  #   line_11.name = "SIR"
  #   line_11.status = "Good Service"
  #
  #   [line_1, line_2, line_3, line_4, line_5, line_6, line_7, line_8, line_9, line_10, line_11]
  #
  # end
end

# ___________   _______________________________________^__
#  ___   ___ |||  ___   ___   ___    ___ ___  |   __  ,----\
# |   | |   |||| |   | |   | |   |  |   |   | |  |  | |_____\
# |___| |___|||| |___| |___| |___|  | O | O | |  |  |        \
#            |||                    |___|___| |  |__|         )
# ___________|||______________________________|______________/
