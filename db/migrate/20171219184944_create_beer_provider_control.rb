class CreateBeerProviderControl < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_provider_controls do |t|
      t.belongs_to :provider
      t.belongs_to :beer
    end
  end
end
