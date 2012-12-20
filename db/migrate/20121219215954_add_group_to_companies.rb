class AddGroupToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :group, :string
  end
end
