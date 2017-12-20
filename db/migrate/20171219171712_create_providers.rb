class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :contact_email, null: false
      t.string :contact_phone, null: false
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps null: false
    end
  end
end
