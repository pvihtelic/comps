class AddLowSalesCyAndHighSalesCyAndLowSalesCyPlusOneAndHighSalesCyPlusOneAndLowEarningsCyAndHighEarningsCyAndLowEarningsCyPlusOneAndHighEarningsCyPlusOneAndEvEbitda < ActiveRecord::Migration
  def change
  	add_column :companies, :low_sales_cy, :decimal
  	add_column :companies, :high_sales_cy, :decimal
  	add_column :companies, :low_sales_cy_plus_one, :decimal
  	add_column :companies, :high_sales_cy_plus_one, :decimal
  	add_column :companies, :low_earnings_cy, :decimal
  	add_column :companies, :high_earnings_cy, :decimal
  	add_column :companies, :low_earnings_cy_plus_one, :decimal
  	add_column :companies, :high_earnings_cy_plus_one, :decimal
  	add_column :companies, :ev_ebitda, :decimal
  end
end
