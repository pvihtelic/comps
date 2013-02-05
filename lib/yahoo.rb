class Yahoo

  def self.scrape
    require 'nokogiri'
    require 'open-uri'
    
    saas_array = ["ATHN", "CNQR", "TRAK", "ET", "N", "RP", "CRM", "NOW", "SREV", "SNCR", "ULTI", "BV", "CTCT", "DWRE", "JIVE", "LPSN", "LOGM", "MDSO", "MKTG", "EOPN", "ELLI", "IL", "SQI", "SPSC", "TNGO", "VOCS"]
    ecommerce_array = ["EBAY", "PCLN", "EXPE", "GRPN", "AWAY", "LQDT", "EGOV", "MWW", "OPEN", "DHX", "OWW", "EHTH", "TZOO"]
    online_retail_array = ["AMZN", "HSNI", "SFLY", "VPRT", "UNTD", "STMP", "NILE", "PRSS", "FLWS", "PETS", "OSTK", "PRTS", "GKNT", "DIET"]
    advertising_tech_array = ["MSFT", "GOOG", "VCLK", "BCOR", "SCOR", "QNST", "RLOC", "MCHX"]
    content_array = ["YHOO", "IACI", "TRIP", "AOL", "NFLX", "P", "RATE", "RNWK", "DMD", "WBMD", "MOVE", "XOXO", "TTGT", "TREE"]
    digital_media_array = ["FB", "LNKD", "MEET", "FFN", "YELP", "Z", "ANGI"]
    gaming_array = ["ATVI", "EA", "ZNGA", "GME", "TTWO", "COOL", "THQI"]
    mobile_array = ["DOX", "MM", "VELT", "GLUU", "TNAV", "AUGT", "TSYS", "MOTR"]
    web_services_array = ["ACTV", "WWWW", "DRIV", "SYNC", "CARB", "TCX"]

    @url = []

    saas_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    ecommerce_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    online_retail_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    advertising_tech_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    content_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    digital_media_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    gaming_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    mobile_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    web_services_array.each do |ticker|
      @url << "http://finance.yahoo.com/q/ae?s=#{ticker}"
    end

    puts @url

    @url.each do |url|
      analyst_data = Nokogiri::HTML(open(url))

      if !analyst_data.nil?
      full_text_name = analyst_data.css("div.title h2").text
      if !full_text_name.nil? && full_text_name.include?("(")
        name = full_text_name.gsub(/\([^()]*\)(?![^\[]*])/,"")
        ticker = full_text_name.scan(/\([^()]*\)(?![^\[]*])/).first.gsub("(","").gsub(")","")
      else
      end
        
      market_data = Nokogiri::HTML(open("http://finance.yahoo.com/q/ks?s=#{ticker}"))
      # puts market_data

      @market_cap_text = market_data.xpath('//span[contains(@id, "yfs_j10")]').text

      stock_price = market_data.xpath('//span[@class="time_rtq_ticker"]/span').text

      # puts share_price

      if !@market_cap_text.nil?
        if @market_cap_text.include?("B")
          @market_cap = @market_cap_text.gsub("B","").to_f*1000
        elsif @market_cap_text.include?("M")
          @market_cap = @market_cap_text.gsub("M","")
        else
        end
      end   

      if !market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[3].nil?
        @enterprise_value_text = market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[3].text
      else
        @enterprise_value_text = 0 
      end

        if !@enterprise_value_text.nil?
          if @enterprise_value_text.include?("B")
            @enterprise_value = @enterprise_value_text.gsub("B","").to_f*1000
          elsif @enterprise_value_text.include?("M")
            @enterprise_value = @enterprise_value_text.gsub("M","")
          else
          end
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
        if market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[17].include?("K")
          @ev_ebitda = "0"
        else
          @ev_ebitda = market_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[17].text
        end
      else
        @ev_ebitda = "0"
      end

      # puts @ev_ebitda

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[28].nil?
        @sales_cy_text = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[28].text
        if @sales_cy_text.include?("B")
          @sales_cy = @sales_cy_text.gsub("B","").to_f*1000
        elsif @sales_cy_text.include?("M")
          @sales_cy = @sales_cy_text.gsub("M","")
        else
          @sales_cy = 0  
        end
      end

      
      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[29].nil?
      @sales_cy_plus_one_text = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[29].text
      end
      if @sales_cy_plus_one_text.include?("B")
        @sales_cy_plus_one = @sales_cy_plus_one_text.gsub("B","").gsub("M","").to_f*1000
      else    
        @sales_cy_plus_one = @sales_cy_plus_one_text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[38].nil?
        @low_sales_cy_text = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[38].text
      end
      @low_sales_cy = @low_sales_cy_text.gsub("B","").gsub("M","")
  
      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[39].nil?
        @low_sales_cy_plus_one = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[39].text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[43].nil?
        high_sales_cy = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[43].text.gsub("B","").gsub("M","")
      end
      
      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[44].nil?
        high_sales_cy_plus_one = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[44].text.gsub("B","").gsub("M","")  
      end
      
      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[48].nil?
        last_year_sales = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[48].text.gsub("B","").gsub("M","")
      end

      # puts high_sales_cy_plus_one

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[3].nil?
        @earnings_cy_text = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[3].text
        earnings_cy = earnings_cy_text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[4].nil?
        earnings_cy_plus_one = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[4].text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[13].nil?
        low_earnings_cy = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[13].text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[14].nil?
        low_earnings_cy_plus_one = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[14].text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[18].nil?
        high_earnings_cy = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[18].text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[19].nil?
        high_earnings_cy_plus_one = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[19].text.gsub("B","").gsub("M","")
      end

      if !analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[23].nil?
        last_year_earnings = analyst_data.xpath('//tr/td[contains(@class, "yfnc_table")]')[23].text.gsub("B","").gsub("M","")
      end

      # puts last_year_earnings

      if !@enterprise_value_text.nil? && !@sales_cy_text.nil?
        if @enterprise_value_text.include?("B") && @sales_cy_text.include?("M")
          @enterprise_value = @enterprise_value_text.gsub("B","").to_f*1000
        elsif @enterprise_value_text.include?("M") && @sales_cy_text.include?("B")
          @enterprise_value = @enterprise_value_text.gsub("M","").to_f/1000 
        end
      else
        @enterprise_value = 0
      end
      
      if @market_cap_text.include?("B") && @earnings_cy_text.include?("M")
        @market_cap = @market_cap_text.gsub("B","").to_f*1000
      elsif @market_cap_text.include?("M") && @earnings_cy_text.include?("B")
        @market_cap = @market_cap_text.gsub("M","").to_f/1000 
      end

      saas_array.each do |saas_ticker|
        if saas_ticker == ticker
          @group = "Software-as-a-Service"
        end
      end

      ecommerce_array.each do |ecommerce_ticker|
        if ecommerce_ticker == ticker
          @group = "eCommerce"
        end
      end

      online_retail_array.each do |online_retail_ticker|
        if online_retail_ticker == ticker
          @group = "Online Retail"
        end
      end

      advertising_tech_array.each do |advertising_tech_ticker|
        if advertising_tech_ticker == ticker
          @group = "Advertising Tech"
        end
      end

      content_array.each do |content_ticker|
        if content_ticker == ticker
          @group = "Content"
        end
      end

      digital_media_array.each do |digital_media_ticker|
        if digital_media_ticker == ticker
          @group = "Digital Media"
        end
      end

      gaming_array.each do |gaming_ticker|
        if gaming_ticker == ticker
          @group = "Gaming"
        end
      end

      mobile_array.each do |mobile_ticker|
        if mobile_ticker == ticker
          @group = "Mobile"
        end
      end

      web_services_array.each do |web_services_ticker|
        if web_services_ticker == ticker
          @group = "Web Services"
        end
      end

      puts ticker

      Company.create(:name=>name,
       :ticker=>ticker, 
       :group=>@group,
       :stock_price=>stock_price, 
       :market_cap=>@market_cap, 
       :enterprise_value=>@enterprise_value, 
       :sales_ltm=>last_year_sales, 
       :sales_cy=>@sales_cy,
       :sales_cy_plus_one=>@sales_cy_plus_one, 
       :low_sales_cy=>@low_sales_cy, 
       :high_sales_cy=>high_sales_cy, 
       :low_sales_cy_plus_one=>@low_sales_cy_plus_one, 
       :high_sales_cy_plus_one=>high_sales_cy_plus_one, 
       :earnings_ltm=>last_year_earnings,
       :earnings_cy=> earnings_cy,
       :earnings_cy_plus_one=> earnings_cy_plus_one,
       :low_earnings_cy=>low_earnings_cy, 
       :high_earnings_cy=>high_earnings_cy, 
       :low_earnings_cy_plus_one=>low_earnings_cy_plus_one, 
       :high_earnings_cy_plus_one=>high_earnings_cy_plus_one, 
       :ev_ebitda=>@ev_ebitda)
    end
    end
  end
end  