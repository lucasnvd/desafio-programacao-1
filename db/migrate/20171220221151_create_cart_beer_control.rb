class CreateCartBeerControl < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_beer_controls do |t|
      t.belongs_to :beer
      t.belongs_to :cart

      t.integer :requested_quantity, default: 0
      t.boolean :removed, default: false

      t.timestamps null: false
    end
  end
end
