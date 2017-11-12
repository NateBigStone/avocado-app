class Avocado < ApplicationRecord
  require 'net/http'
  belongs_to :user
  belongs_to :location
  enum category: [ "Tiny Hass",  "Small Hass", "Medium Hass", "Large Hass", "Jumbo Hass", "Other Kind" ]
  # def tiny_unit
  #   3.1 #ounces
  # end
  # def small_unit
  #   5.2 #ounces
  # end
  # def medium_unit
  #   7.4 #ounces
  # end
  # def large_unit
  #   9.8 #ounces
  # end
  # def jumbo_unit
  #   12.2 #ounces
  # end
end
