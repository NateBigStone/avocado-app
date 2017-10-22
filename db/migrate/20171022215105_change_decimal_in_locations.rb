class ChangeDecimalInLocations < ActiveRecord::Migration[5.1]
  def change
    change_column :locations, :lat, "numeric USING CAST(lat AS numeric)"
    change_column :locations, :lat, :decimal, precision: 15, scale: 10
    change_column :locations, :lng, "numeric USING CAST(lng AS numeric)"
    change_column :locations, :lng, :decimal, precision: 15, scale: 10
  end
end
