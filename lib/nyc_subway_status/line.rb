class NYCSubwayStatus::Line
  attr_accessor :name, :status, :details

  URL = 'http://web.mta.info/status/serviceStatus.txt'

  def self.get_names(url=URL)
    names = []
    @doc = Nokogiri::HTML(open(url))
    @doc.xpath("//name").collect do |name|
      names << name.children.text
    end

    linez = names[0..10]
    binding.pry
    # lines = []
    # top_page.css("#subwayDiv").each do |entry|
    #   entry.css("")
  end

  # class Scraper
  #
  #   def self.scrape_index_page(index_url)
  #     index_page = Nokogiri::HTML(open(index_url))
  #     students = []
  #     index_page.css(".roster-cards-container").each do |card|
  #       card.css(".student-card a").each do |student|
  #         student_name = student.css(".student-name").text
  #         student_location = student.css(".student-location").text
  #         student_profile_link = "#{student.attr("href")}"
  #         students << {name: student_name, location: student_location, profile_url: student_profile_link}
  #       end
  #     end
  #     students
  #   end
  #

  def self.all

    line_1 = self.new
    line_1.name = "1,2,3"
    line_1.status = "Good Service"

    line_2 = self.new
    line_2.name = "4,5,6"
    line_2.status = "Good Service"

    line_3 = self.new
    line_3.name = "7"
    line_3.status = "Good Service"

    line_4 = self.new
    line_4.name = "A,C,E"
    line_4.status = "Good Service"

    line_5 = self.new
    line_5.name = "B,D,F,M"
    line_5.status = "Good Service"

    line_6 = self.new
    line_6.name = "G"
    line_6.status = "Good Service"

    line_7 = self.new
    line_7.name = "J,Z"
    line_7.status = "Good Service"

    line_8 = self.new
    line_8.name = "L"
    line_8.status = "Good Service"

    line_9 = self.new
    line_9.name = "N,Q,R,W"
    line_9.status = "Good Service"

    line_10 = self.new
    line_10.name = "S"
    line_10.status = "Good Service"

    line_11 = self.new
    line_11.name = "SIR"
    line_11.status = "Good Service"

    [line_1, line_2, line_3, line_4, line_5, line_6, line_7, line_8, line_9, line_10, line_11]

  end



end

# class DailyDeal::Deal
#   attr_accessor :name, :price, :availability, :url
#
#   def self.today
#     # Scrape woot and meh and then return deals based on that data
#     self.scrape_deals
#   end
#
#   def self.scrape_deals
#     deals = []
#
#     deals << self.scrape_woot
#     deals << self.scrape_meh
#
#     deals
#   end
#
#   def self.scrape_woot
#     doc = Nokogiri::HTML(open("https://woot.com"))
#
#     deal = self.new
#     deal.name = doc.search("h2.main-title").text.strip
#     deal.price = doc.search("#todays-deal span.price").text.strip
#     deal.url = doc.search("a.wantone").first.attr("href").strip
#     deal.availability = true
#
#     deal
#   end
#
#   def self.scrape_meh
#     doc = Nokogiri::HTML(open("https://meh.com"))
#
#     deal = self.new
#     deal.name = doc.search("section.features h2").text.strip
#     deal.price = doc.search("button.buy-button").text.gsub("Buy it.", "").strip
#     deal.url = "https://meh.com"
#     deal.availability = true
#
#     deal
#   end
# end
