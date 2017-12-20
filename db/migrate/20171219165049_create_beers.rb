class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.integer :available, default: 12
      t.decimal :alcohol, default: 0.0, precision: 20, scale: 6
      t.decimal :price,   default: 0.0, precision: 20, scale: 6
      t.string :malts,    null: false
      t.string :name,     null: false

      t.timestamps null: false
    end
  end
end
