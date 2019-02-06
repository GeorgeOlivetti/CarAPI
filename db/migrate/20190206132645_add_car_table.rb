class AddCarTable < ActiveRecord::Migration[5.2]
  def change
      create_table :cars do |t|
      t.string :vin
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.string :ownerFirstName
      t.string :ownerLastName
    end
  end
end
