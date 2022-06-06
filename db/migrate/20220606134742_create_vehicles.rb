class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.decimal :price_per_day
      t.integer :year
      t.string :category
      t.text :descritpion
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
