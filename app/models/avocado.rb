class Avocado < ApplicationRecord
  require 'net/http'
  belongs_to :user
  belongs_to :location
  enum category: [ "Tiny Hass",  "Small Hass", "Medium Hass", "Large Hass", "Jumbo Hass", "Other Kind" ]
  def image_math(level)
    level = level.to_i
    image = ""
    if level == 10
      image = "10ripe"
    elsif level > 7
      image = "9ripe"
    elsif level > 6
      image = "7ripe"
    else
      image = "1ripe"
    end
    image
  end
end
