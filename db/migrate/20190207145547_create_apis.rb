class CreateApis < ActiveRecord::Migration[5.2]
  def change
    create_table :api do |t|
      t.string :token
      t.string :firstName
      t.string :lastName
      t.timestamps
    end
  end
end
