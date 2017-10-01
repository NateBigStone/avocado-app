class ChangeTypeInAvocados < ActiveRecord::Migration[5.1]
  def change
    change_column :avocados, :price, "numeric USING CAST(price AS numeric)"
    change_column :avocados, :price, :decimal, precision: 5, scale: 2
    remove_column :avocados, :type, :string
    add_column :avocados, :category, :integer
    add_column :avocados, :organic, :boolean
  end
end
