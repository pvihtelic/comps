class Yahoo

  def self.scrape
    require 'nokogiri'
    require 'open-uri'

    
    tickers_array = ["DOW", "ZIP", "BAC", "NFLX"]

    @url = []

    tickers_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    puts @url

    @url.each do |url|
      analyst_data = Nokogiri::HTML(open(url))

      full_text_name = earnings_data.css("div.title h2").text
      name = full_text_name.gsub(/\([^()]*\)(?![^\[]*])/,"")
      ticker = full_text_name.scan(/\([^()]*\)(?![^\[]*])/).first.gsub("(","").gsub(")","")

      market_data = Nokogiri::HTML(open("http://finance.yahoo.com/q?s=#{ticker}"))
      
      puts name

    end
  end
end  