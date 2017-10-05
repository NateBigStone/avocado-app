class Avocado < ApplicationRecord
  belongs_to :user

  enum category: ["Tiny Hass", "Small Hass", "Medium Hass", "Large Hass", "Jumbo Hass", "Other Kind"]

end
