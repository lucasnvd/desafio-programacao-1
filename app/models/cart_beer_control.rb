class CartBeerControl < ApplicationRecord
  belongs_to :beer
  belongs_to :cart

  scope :still_present, -> { where(removed: false) }

end