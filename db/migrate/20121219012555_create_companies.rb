class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ticker
      t.decimal :market_cap
      t.decimal :enterprise_value
      t.decimal :sales_ltm
      t.decimal :sales_cy
      t.decimal :sales_cy_plus_one
      t.decimal :earnings_ltm
      t.decimal :earnings_cy
      t.decimal :earnings_cy_plus_one

      t.timestamps
    end
  end
end
