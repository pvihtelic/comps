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
      data = Nokogiri::HTML(open(url))

      full_text_name = data.css("div.title h2").text
      name = full_text_name.gsub(/\([^()]*\)(?![^\[]*])/,"")
      ticker = full_text_name.scan(/\([^()]*\)(?![^\[]*])/).first.gsub("(","").gsub(")","")
      
      
      puts name

    end
  end
end  