class BeerProviderControl < ApplicationRecord

  belongs_to :provider
  belongs_to :stock

end