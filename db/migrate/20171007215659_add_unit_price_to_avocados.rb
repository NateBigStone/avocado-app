class AddUnitPriceToAvocados < ActiveRecord::Migration[5.1]
  def change
    add_column :avocados, :unit_price, :integer
  end
end
