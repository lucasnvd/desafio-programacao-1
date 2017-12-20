class Beer < ApplicationRecord
  has_and_belongs_to_many :providers,
                          join_table: :beer_provider_controls

end