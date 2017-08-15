class NYCSubwayStatus::Scraper

  URL = 'http://www.mta.info/'

  def self.get_page(url=URL)
    Nokogiri::HTML(open(url))
  end

end
