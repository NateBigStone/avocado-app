class Avocado < ApplicationRecord
  belongs_to :user
  belongs_to :location

  enum category: [ "Tiny Hass",  "Small Hass", "Medium Hass", "Large Hass", "Jumbo Hass", "Florida" ]

  def tiny_unit
  end
  def small_unit
    5.2 #ounces
  end
  def medium_unit
    7.4 #ounces
  end
  def large_unit
  end
  def jumbo_unit
  end
end
