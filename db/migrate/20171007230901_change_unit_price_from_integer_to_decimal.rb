class ChangeUnitPriceFromIntegerToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :avocados, :unit_price, "numeric USING CAST(price AS numeric)"
    change_column :avocados, :unit_price, :decimal, precision: 5, scale: 2
  end
end
