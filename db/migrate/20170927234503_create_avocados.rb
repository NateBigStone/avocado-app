class CreateAvocados < ActiveRecord::Migration[5.1]
  def change
    create_table :avocados do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :type
      t.integer :price
      t.integer :ripeness
      t.datetime :spoiled_on
      t.text :notes

      t.timestamps
    end
  end
end
