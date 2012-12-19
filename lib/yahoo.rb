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

      full_text_name = analyst_data.css("div.title h2").text
      name = full_text_name.gsub(/\([^()]*\)(?![^\[]*])/,"")
      ticker = full_text_name.scan(/\([^()]*\)(?![^\[]*])/).first.gsub("(","").gsub(")","")

      market_data = Nokogiri::HTML(open("http://finance.yahoo.com/q/ks?s=#{ticker}"))
      # puts market_data

      market_cap_text = market_data.xpath('//span[contains(@id, "yfs_j10")]').text

      if market_cap_text.include?("B")
        market_cap = market_cap_text.gsub("B","").to_i*1000
      elsif market_cap_text.include?("M")
        market_cap = market_cap_text.gsub("M","")
      else
      end 

      if !market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[3].nil?
        @enterprise_value_text = market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[3].text
      else
        @enterprise_value_text = "0" 
      end

      if @enterprise_value_text.include?("B")
        enterprise_value = @enterprise_value_text.gsub("B","").to_i*1000
      elsif @enterprise_value_text.include?("M")
        enterprise_value = @enterprise_value_text.gsub("M","")
      else
      end

      # puts enterprise_value

      # NOT AN EXLPLICIT COLUMN IN THE DATABASE - EV / TTM SALES
      if !market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[15].nil?
        @ev_sales = market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[15].text
      else
        @ev_sales = "0" 
      end


      # NOT AN EXLPLICIT COLUMN IN THE DATABASE - EV / TTM EBITDA
      if !market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[17].nil?
        @ev_ebitda = market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[17].text
      else
        @ev_ebitda = "0" 
      end

      # puts @ev_ebitda

      cy_sales_text = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[28].text.gsub("B","").gsub("M","")
      
      
      puts cy_sales_text

      # sales_cy_plus_one_text = 
      # earnings_ltm =
      # earnings_cy_text = 
      # earnings_cy_plus_one_text = 



    end
  end
end  