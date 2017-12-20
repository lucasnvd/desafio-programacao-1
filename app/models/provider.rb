class Provider < ApplicationRecord
  has_and_belongs_to_many :beers,
                          join_table: :beer_provider_controls

end