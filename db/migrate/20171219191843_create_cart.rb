class CreateCart < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :user

      t.integer :status, default: 1 # status 1 -> Open
      t.timestamps null: false
    end
  end
end
