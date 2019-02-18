class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.integer :token
      t.string :firstName
      t.string :lastName
      t.timestamps
    end
  end
end
