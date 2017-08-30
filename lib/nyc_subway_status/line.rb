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
    (0..get_names.size-1).to_a.each do |i|
      line_name = get_names[i]
      line_status = get_status[i]
      line_details = "http://www.mta.info/status/subway/#{get_names[i]}"

      line = self.new
      line.name = line_name
      line.status = line_status
      line.details = line_details
      line.save
    end
    all
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

end

# ___________   _______________________________________^__
#  ___   ___ |||  ___   ___   ___    ___ ___  |   __  ,----\
# |   | |   |||| |   | |   | |   |  |   |   | |  |  | |_____\
# |___| |___|||| |___| |___| |___|  | O | O | |  |  |        \
#            |||                    |___|___| |  |__|         )
# ___________|||______________________________|______________/
