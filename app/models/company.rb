class Company < ActiveRecord::Base
  attr_accessible :earnings_cy, :earnings_cy_plus_one, :earnings_ltm, :enterprise_value, :market_cap, :name, :sales_cy, :sales_cy_plus_one, :sales_ltm, :ticker, :low_sales_cy, :high_sales_cy, :low_sales_cy_plus_one, :high_sales_cy_plus_one, :low_earnings_cy, :high_earnings_cy, :low_earnings_cy_plus_one, :high_earnings_cy_plus_one, :ev_ebitda, :stock_price, :group
end
