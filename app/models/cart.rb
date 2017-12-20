class Cart < ApplicationRecord
  # belongs_to :order
  belongs_to :user

  has_many :items, class_name: :CartBeerControl
  has_many :beers, through: :items

  enum status: { open: 1, canceled: 2, closed: 3 }

  scope :still_open, -> { where(status: 1) }

end