class AddStockPriceToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :stock_price, :decimal
  end
end
