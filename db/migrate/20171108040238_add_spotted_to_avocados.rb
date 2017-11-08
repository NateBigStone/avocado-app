class AddSpottedToAvocados < ActiveRecord::Migration[5.1]
  def change
    add_column :avocados, :spotted, :datetime
  end
end
