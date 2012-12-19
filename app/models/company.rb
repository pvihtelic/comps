class Company < ActiveRecord::Base
  attr_accessible :earnings_cy, :earnings_cy_plus_one, :earnings_ltm, :enterprise_value, :market_cap, :name, :sales_cy, :sales_cy_plus_one, :sales_ltm, :ticker
end
